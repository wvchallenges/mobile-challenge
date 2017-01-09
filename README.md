# Wave Software Development Challenge

## Setup

1. Fork or clone the repository at https://github.com/Blisse/mobile-challenge/
2. Open the project in Android Studio (2.0+)
3. Build and run the application from Android Studio

The app's minimum supported version is KitKat (19). 
The app is compiled for Nougat 7.1 (25). 
The app has primarily been tested on Marshmallow (23).

## Implementation

### External Libraries

* [Dagger 2](https://google.github.io/dagger/) for dependency injection
* [Retrofit](https://square.github.io/retrofit/) for simplifying APIs
* [Butter Knife](http://jakewharton.github.io/butterknife/) for view binding
* [OkHttp](http://square.github.io/okhttp/) for handling HTTP requests

### Comments

I really like the separation of concerns I can achieve with Dagger. In the `ApplicationModule` class, I specified the dependency tree necessary to instantiate the services I will use. In more complex applications, I can create multiple modules for more specific functionality (networking, APIs, custom components). In this way with Dagger, only exposing the interfaces used by the class allows the user to skip all of the implementation details. 

For example, the `ProductsActivity` has the `@Inject ProductsService productsService` member, which is injected when `WaveChallengeApplication.from(this).getApplicationComponent().inject(this);` is called. By using dependency injection, the `ProductsActivity` (or any other user) doesn't need to bother with knowing how `Retrofit` is instantiated.
