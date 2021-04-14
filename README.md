# Wave Software Development Challenge by Roman Mbwasi


![Workflow result](https://github.com/matale/mobile-challenge/workflows/Check/badge.svg)
Native Android Application for the Wave Mobile challenge. 
This App will fetch data from the Wave API and display it in a list/RecyclerView.

## :wrench: Setup instructions
1. Launch Android Studio
1. File ->New -> Project from version Control
1. Enter the repo address https://github.com/matale/mobile-challenge.git
1. Hit clone.
1. Run the project on emulator or device >= Android SDK 24

## :scroll: Details
App follows the [Android architecture guide](https://developer.android.com/jetpack/guide) which is simmilar to MVVM design pattern.
I have made use of the architecture components and Jetpack libraries whenever possible. 
Some of the components and libraries include Fragments, Navigation, ViewModel, LiveData, Retrofit and Kotlin Coroutines.

## :white_check_mark: Testing
A simple Espresso/UI test is included that checks that the App launches and the list is displayed.

## :rocket: CI
I have included a github action that builds the App on Github when it is pushed to master and runs the tests to produce a test report.


