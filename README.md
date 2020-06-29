# Listings App
This example application fetches a list of products for the user.  The project focuses on giving a general illustration of production level technical practices, and does not delve deep into UI & UX production readiness.

## Running the App
```sh
$ brew install swiftlint
$ pod install
$ open Listings.xcworkspace
```
Open the file `AppSecrets.swift` and past your bearer token into the string listed as `bearerToken`, and you are good to go!

## About this App

### Project Organization & Conventions
- feature groups, micro-service type architecture
- avoid vague naing `utilities`, `helper`, `manager`, but use verbs and adjectives that genreally adhere to swift naming conventions
- alphabetical sorting to avoid project file conflicts
- copy goes in `Copy` folder
- scripts and tooling go in `scripts` folder
- postman `Listings.postman_collection.json` to help you debug network calls

### Tooling + Compile-time Safety
- swiftlint is used to provide deeper guardrails for code quality.  For example, we may want to catch poor dependency injection practices where a resolver is passed as opposed to a resolved dependency (`injector_import`), we may also want to enforce architectural conventions like keeping the VM UIKit free (`viewmodel_uikit_import`).
- localization keys are added as auto-generated enum cases to avoid typos.  this is done by running `copy_dump.sh` which will take the contents of a copy file like `ProductsCopy.csv` and automatically generate `ProductsCopy.string` and `ProductsCopy.swift`.
- similarly, when loading test resources from bundle, we build a `BundleFileLoader` that promotes compile-time safety

### BDD style TDD
- `Quick` and `Nimble` are used to allow us to write BDD R-Spec styled tests that improve readability and encourages input-output thinking on a feature acceptance level.  This helps tests be more resiliant, implementation agnostic, and closer to being living documentation.

### Dependency Injection + Storyboards
- `Swinject` is used for dependency injection.  A single `DependencyRegistrar` lives at the `SceneDelegate` level.  This registrar contains the instantiation & resolution instructions.  We've also added a swift-lint rule to limit `Swinject` imports since passing a 'god' resolver around is a bit of a code smell that defeats the purpose of DI.
- Use of singletons is generally discouraged to better isolate objects and undersatnd their input/outputs without reference to global state.  This helps the code be easier to reason about, and avoid test contamination.  For example, instead of having a `DataService` shared instance, we intead register it as a dependnecy with `.container` scope – since the container lives at the app level, every request for data service will refer to the single container instance.  Another example is `ProductListItem` where a `Locale` is needed to properly format currency – instead of relying on global state (the user's preference), this allows us to inject a different locale for unit testing.

### Factory Pattern + Storyboards
- For the instantiation of screens & flows, a factory pattern is used.  This is to avoid dependency bloat, where dependencies flow lower level objects float upwards into the instantiation signatures of higher level objects.  For this reason, there's an exception made for factories to hang-on to a resolver isntance (e.g. `AppUIFactory` and `ProductsUIFactory`)
- For DI reasons, storyboard-based 'wirings' have been limited to contraints & layouts.  Things like storyboard segues and runtime attributes are hard to keep track of, and make DI tricky – in many ways, storyboards is a UI-based dependency injector (e.g. `@IBOutlet`s are just flags for the storyboard to property inject something).  There are ways around DI and storyboards like `SwinjectStoryboard`, but the factory pattern was chosen because it seems more explicit and expressive.

### `MVVM-C` Architecture
The `MVVM` architecture paradigm does not have a well fleshed-out common understanding amongst developers in the community.  In the context of this app, to avoid divergent patterns, here are a points to show what 'we' take `MVVM-C` to mean.

**Views and view controllers** are treated as a single unit, and contain purely UI decorative & styling logic.

#### Additional notes
- reversing the coord & nav relationship

## Areas for Improvement

- documentation
- CI integration, Danger
- UI tests
- voice over & accessibility, styling

