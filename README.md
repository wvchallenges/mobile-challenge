# Wave Software Development Challenge

This Android app is written in Kotlin and includes a fragment container on the main activity, in which a recycler view is used to display a list of products.

The product data is pulled from the Wave Api, using Retrofit for de-serialization, and RxJava for the asyncronous calls and observable streams. I wanted to use a more modern type of pagination and chose to emply an 'endless scroll' paging effect. The PagedListAdapter I created has a page size of 5 items and automatically pulls more product data as the user reaches the end of the scroll range.

I chose to use an MVVM design pattern, taking care to keep the Android context out of the view models to allow for better testability of the business logic. I also created a ProductDataManager to add a layer of separation between the webservice/models and the rest of the app. After calling the webservice, the data is immediately transformed into the appropriate view models, before being data bound to the subsequent views.

## How to demo the app

1. The app target Api Level is 27, but I set the minSdk to 23. So any device with Marshmellow, Android 6.0, or higher should be fine.
1. Simply clone this repository, https://github.com/chrisszendrovits/mobile-challenge.git, to grab a local copy of the project.
1. Open the project in Android Studio.
1. Find the local.properties file in the project, and add the wave api key, as follows:

wave_apikey="<your_key_here>"
