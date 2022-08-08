# Wave Challenge Code - Product List View

I have used React Native framework in JavaScript for this challenge. 

## Project Description
- When the API call is successful with no errors, I am showing the Products page
  
  <img src="https://raw.githubusercontent.com/fadiaIW/wave-mobile-challenge/master/src/assets/images/1.png" alt="Success" width="200"/>

- In case of an error, I have created an error page.
  
  <img src="https://raw.githubusercontent.com/fadiaIW/wave-mobile-challenge/master/src/assets/images/2.png" alt="Success" width="200"/>

- Incase of no internet connection, I am displaying a toast as well as a No internet connection page. 


  <img src="https://raw.githubusercontent.com/fadiaIW/wave-mobile-challenge/master/src/assets/images/3.png" alt="Success" width="200"/>



## Installation

Clone the repository using the command below
```sh
$ git clone https://github.com/fadiaIW/wave-mobile-challenge.git
```
Install the dependencies and devDependencies and start the server.

```sh
cd wave-mobile-challenge
npm i
```

For iOS

```sh
cd ios && pod install
npx react-native run-ios
```

For Android

```sh
npx react-native run-android
```

## What am I proud of in the implementation?
I created the currencyDisplay function in the helper file, which uses Intl.NumberFormat,  to convert the price in CAD format, but is scalable to other currencies if required in the future. 
