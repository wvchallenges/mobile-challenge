# Mobile Challenge

### How to set up application
1. Clone this repo.
2. In Android Studio:
  1. Quick Start "Import project".
  2. Navigate to import mobile-challenge/Wave.
  
### How to run application
1. [Set up your own Android Device configuration](http://developer.android.com/tools/building/building-studio.html) or click the green "Play" button to run the app, choosing an appropriate already running device or launching an appropriate emulator to do so.
2. The application should now be running on the device (please allow some time for app to run!)

### Implementation highlights
I'm particularly happy that I used Spring's RestTemplate to implement the REST client. I've never used Spring before, and when I did so, it not only jived with the Android app very simply and cleanly, but it got most of the client-side HTTP access job done.

Other than that, I was happily surprised I guessed correctly, on the first try, the url string needed to successfully access the Wave Apps Products endpoint.

### App preview

![Screenshot of app](https://github.com/parker-mar/mobile-challenge/blob/master/Wave/Preview.png)
