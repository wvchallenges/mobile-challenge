# Listings App
This example application fetches a list of products for the user.  The project focuses on giving a general illustration of production level technical practices, and does not delve deep into UI & UX production readiness.

## Running the App
```sh
$ brew install swiftlint
$ pod install
$ open Listings.xcworkspace
```
Open the file `AppSecrets.swift` and paste,
1. your bearer token into the string listed as `bearerToken`,
2. your business-id into the string listed as `businessId`,

and you are good to go!

## About this App

### Project Organization & Conventions
- Folder structure uses **feature groups** approach that mimics micro-service architecture (as opposed to functional groups like views, view-models, controllers, etc).  This makes it easier to pull things into modules later for plaformization.
- Generally avoided vague terms like `helper`, or `manager` as much as possible, but tried to use **precise verbs and adjectives** such as `Inflating` or `Transitioning` that adhere to [swift conventions](https://swift.org/documentation/api-design-guidelines/).
- **Alphabetical file sorting** to minimize project file conflicts.
- Folders `Copy` and `scripts` contain (1) static copy for screens, and (2) tooling scripts, respectively.
- Exported endpoints collection `Listings.postman_collection.json` at root level can be used to help developers test against the backend API.

### Tooling + Compile-time Safety
- [`SwiftLint`](https://github.com/realm/SwiftLint) is used to provide **deeper guardrails for code quality**.  For example, we may want to catch poor DI practice where a resolver is passed as opposed to a resolved dependency with a custom rule called [`injector_import`](https://github.com/sksw/mobile-challenge/blob/8d7070e66ff692150bc33fe83277342b3300b091/.swiftlint.yml#L17).
- Localization keys are **auto-generated enum cases to avoid typos that stay silent until run-time**.  This is done by running `copy_dump.sh`  – it takes the contents of a copy file like `ProductsCopy.csv` and automatically generates the corresponding `ProductsCopy.string` and `ProductsCopy.swift` files with matching keys and enum raw values.
- Similar pattern of `enum` with `String` `RawRepresentable` is used to ensure safe loading of test resources from bundle (see [`BundleFileLoader`](https://github.com/sksw/mobile-challenge/blob/master/ListingsTests/BundleFileLoader.swift)).
- [`SwiftyBeaver`](https://github.com/SwiftyBeaver/SwiftyBeaver) used for logging – run app and pull to refresh to see logging output.
- [`Moya`](https://github.com/Moya/Moya) used for **expressive API definition**, e.g. [`ProductsAPI`](https://github.com/sksw/mobile-challenge/blob/master/Listings/Products/ProductsAPI.swift)
- **[`RxSwift`](https://github.com/ReactiveX/RxSwift)** allows for (1) easy to read async RFP code, (2) an elegant replacement for delegates & notifications, and (3) support of binding UI in MVVM architecture (though `RxCocoa` has not been introduced).  Using this does come with a **stack & debuggability cost** – also, not all developers are familiar with Rx or RFP paradigms.

### BDD style TDD
- [`Quick`](https://github.com/Quick/Quick) and [`Nimble`](https://github.com/Quick/Nimble) are used to write [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development), R-Spec styled, tests that improve readability and encourage input-output thinking on a feature level.  This helps tests be more resiliant, implementation agnostic, and closer to behaving like **living feature documentation**.

### Dependency Injection + Storyboards
- [`Swinject`](https://github.com/Swinject/Swinject) is used for dependency injection.  A single [`DependencyRegistrar`](https://github.com/sksw/mobile-challenge/blob/master/Listings/DependencyRegistrar.swift) living at the `SceneDelegate` level contains the instantiation & resolution instructions.  As noted before, a lint rule exists to detect resolver-passing code-smell.
- Generally **avoided use of global vars or singletons** to better isolate objects, and understand their input/outputs without reference to global state.  This helps the code be easier to reason about, and avoid test contamination.  For example, instead of having a `DataService` shared instance, we instead register it as a dependnecy with [`.container`](https://github.com/sksw/mobile-challenge/blob/8d7070e66ff692150bc33fe83277342b3300b091/Listings/DependencyRegistrar.swift#L55) scope – since the container lives at the app level, every request for data-service will return a single container instance that lives for the lifetime fo the app.  Another example is `ProductListItem`, where a `Locale` is used to format currency – again, instead of directly pointing to global state [`Locale.current`](https://github.com/sksw/mobile-challenge/blob/8d7070e66ff692150bc33fe83277342b3300b091/Listings/DependencyRegistrar.swift#L59), a different locale can be [injected for unit testing](https://github.com/sksw/mobile-challenge/blob/8d7070e66ff692150bc33fe83277342b3300b091/ListingsTests/Products/ProductListItem%2BMappingSpec.swift#L50).

### Factory Pattern + Storyboards
- For the instantiation of screens & flows, a **factory pattern is used to avoid dependency bloat**, where dependencies of lower level objects float upwards into the instantiation signatures of higher level objects.  For this reason, a [lint exception is made for factories](https://github.com/sksw/mobile-challenge/blob/8d7070e66ff692150bc33fe83277342b3300b091/Listings/AppUIFactory.swift#L10) to hang-on to a resolver instance (see `AppUIFactory` and `ProductsUIFactory`).
- For DI reasons, **storyboard-based 'wirings' have been limited to contraints & layouts**.  For example, on app-launch, automatic entry into `Main.storyboard` has been removed in favour of displaying an [injected app-flow](https://github.com/sksw/mobile-challenge/blob/8d7070e66ff692150bc33fe83277342b3300b091/Listings/SceneDelegate.swift#L65).  Things like storyboard-segues and user-defined-runtime-attributes are hard to keep track of (buried under storyboard settings panel), and make DI tricky – in many ways, storyboards is a UI-based dependency injector (e.g. `@IBOutlet`s are flags for the storyboard to perform property injection).  There are ways around DI and storyboards like `SwinjectStoryboard`, but the factory pattern was chosen because it seems more explicit and expressive.

### `MVVM-C` Architecture
The `MVVM` architecture paradigm does not have a well fleshed-out common understanding amongst developers in the community.  In the context of this app, to avoid divergent patterns, here are a pointers to 'our' take on `MVVM-C`.

- **`Views` + `View-Controllers`**:
  - are treated as a single unit
  - **contains** UI decorative & styling logic
  - does **not contain** business & state logic
  - should be **element specific** and avoid reference to higher order logic e.g. where it sits in relation to other elements or other screens in a flow.
- **`View-Models`**:
  - **contains** UX state & interaction logic
  - **may contain** some business-logic without infringing on the responsibilities of lower level service objects (e.g. chaining multiple requestst, persistence, etc)
  - does [**not contain** styling or decorative logic](https://github.com/sksw/mobile-challenge/blob/8d7070e66ff692150bc33fe83277342b3300b091/.swiftlint.yml#L23) that convey the look & feel of a screen (e.g. instead of `.drillIntoProduct(product)`, use `.userSelected(product)` – the former alludes to style whereas the latter only alludes to intent)
  - should be **element specific** like corresponding views & view-controllers.
- **`Models` or `Services`**:
  - **contains** business logic.
  - `Models` are generally structs.
- **`Coordinators`**:
  - **contains** flow-level logic that maps between screens
  - **similar** to view-models but scaled to the navigation level, e.g. element-specific means flow-specific.

#### Example
- `ProductListViewController` contains UI decorative logic & styling choices.
- `ProductListViewModel` responds to user pull-to-refresh, and maps fresh data from `ProductsDataServicing` to a user-context specific format.
- `DataService` peforms the business logic of fetching products, updating in-memory cache, and perhaps persistence in the future (or may offload it to another dependency).
- `ProductsCoordinator` (currently does nothing since the flow is single page) handles the navigation of the 'products flow', whether that be drilling into a product or presenting a CTA.
- `AppCoordinator` (only handles 1 flow at the moment) switches between subsequent navigation paths such as 'products flow' or 'auth flow'.


**NOTE**  The view-controller hangs onto the `UIKit` agnostic view-model.  Currently, the root view-controller or navigation-controller hangs onto the coordinator to mimic the VM-V/VC relationship, I am undecided about the nature of this relationship since I've done the reverse in the past with mixed outcomes.

## Areas to be Worked-on

- Better documentation & test coverage, e.g. [`ObservableType+Subscribing`](https://github.com/sksw/mobile-challenge/blob/master/Listings/RxUtilities/ObservableType%2BSubscribing.swift) is missing both (not tested to ensure reliabliity in frequent use, nor discoverable).
- CI integration, e.g. `Travis` and `Fastlane` to improve feedback & add some linting enforcement.
- UI-tests or [unit-based-UI](https://github.com/connected-io/UnIt) tests that ensure V/VC level glue code function as desired.
- Voice over & accessibility, UX polish, styling-guide/pallette, etc.
- 'Disposal testing' to check for retain cycles (since Rx has a lot of closures).
- Error handling, other `TODO`s listed.

