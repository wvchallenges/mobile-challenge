# Wave Software Development Challenge

## Setup

1. Fork or clone the repository at https://github.com/Blisse/mobile-challenge/
2. Open the project in Android Studio (2.0+)
3. **Important** Open the `gradle.properties` file and add these two lines for credentials
    1. `wave_business_id="<business_id>"`
    2. `wave_access_token="<access_token>"`
4. Build and run the application from Android Studio

The app's minimum supported version is KitKat (19).
The app is compiled for Nougat 7.1 (25).
The app has primarily been tested on Marshmallow (23).

## Implementation

### External Libraries

* [Dagger 2](https://google.github.io/dagger/) for dependency injection
* [Retrofit](https://square.github.io/retrofit/) for simplifying API calls
* [Butter Knife](http://jakewharton.github.io/butterknife/) for view binding

### Comments

I really like the separation of concerns I can achieve using Dagger. The `ApplicationModule` class specifies the dependency tree necessary to instantiate all the services. In more complex applications, multiple modules can be created for specific stacks or services. As a result, the `ApplicationComponent` interface only needs to know the types of the classes it needs to inject (by inheriting the module's graph), and any user of the `ApplicationComponent` interface is unaware of the implementation details of `ProductsService`, such as how `Retrofit` is instantiated and creates the service.

I also really enjoy using `ButterKnife`, which is a binding library for views to fields. Instead of cluttering the class with `findViewbyId(R.id...)` calls, `ButterKnife` automatically injects them into member variables via `@BindView(R.id...) RecyclerView productsRecyclerView`.
