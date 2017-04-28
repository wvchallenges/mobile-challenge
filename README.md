Evandro Lima Mobile Challenge
---

## How to build and run
1. Run ./gradlew clean assembleRelease
1. You will find the compiled apk under ./app/build/outputs/apk/*.apk
1. I added an already compiled apk ./eslimaf-challenge.apk, this apk was compiled in release mode and signed with a dummy release key
1. To install the apk simply run: adb install \<path-to-file\>/eslimaf-challenge.apk

## About the solution
* In this solution I followed MVP pattern to increase decoupling making changes and reuse easier in the long run. I didn't separete in a feature based packages as the application has only one feature, but I would follow that path while growing the code base.
* In the infrastructure package, I put the API and network related classes, which is basically an instance provider (Singleton) that will build the API service class using [Retrofit](https://github.com/square/retrofit) and [Gson](https://github.com/google/gson) to parse the retrieved JSON.
* I also wrote some tests, of course not a full suite, just some Unit Tests to illustrate how we could test the android independent layers. I used [Mockito](http://site.mockito.org/) to provide mocks. On the UI tests I used Espresso, and illustrated how we could test async requests using IdlingResource feature.

### What I would add?
I didn't use any dependency injection library for simplicity, but I used the DI concepts in the Presenter to be able to inject a different instance (mocked one) of the WaveApi service object. In a commercial project I would probably leverage on [Dagger2](https://google.github.io/dagger/)

---
Thanks in advance, Evandro Lima