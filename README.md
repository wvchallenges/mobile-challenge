# Wave Software Development Challenge

The following is a product listing application for displaying products by the WAVE API using React Native
## INSTRUCTIONS
Following are the instructions for running the application on Android and IOS.
1) Clone the project from the forked location.
2) Navigate to root directory and execute  npm install for fetching node modules
3) Ensure you have react-native installer installed  globally. If not installed it by using the following command
    a) ```npm i react-native-cli -g```
    b) Execute react-native link for linking the installed node modules
4) Navigate to ios directory using cd ios and execute pod install. For cocoa pods first check if pod is present using
```pod --version```. If not install cocoa pods using ``` sudo gem install cocoapods```
5) Run npm run ios for IOS simulator and npm run android for Android Emulator.



The reason I am particularly proud of this solution is it structuring using React Redux for state management owing to which things can be handled efficiently based on state changes. Also have used typescript to ensure type checking of elements. Have
additionally added libraries like react-navigation owing to which additional screens particularly like a Detail page can be
added easily. 