##Highlights

This solution makes use of the repository pattern to decouple the data access layer from the user interface. The repository acts as a bridge between these two layers.

Product objects are wrapped by LiveData which observes the lifecycle of the main activity, minimising the chance of data leaks. The main activity observes this LiveData object to ensure that the UI matches the actual data.

A ViewModel is used to transport data from the repository to the app's RecyclerView. This ViewModel manages data retention through configuration changes.

##Setup

1. Download the .apk file is located at the root of this repository.
1. Open a terminal and navigate to the directory of the downloaded .apk
1. Use ADB to install <code>adb install "app-debug.apk"</code>
