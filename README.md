# Wave Software Development Challenge
Applicants for the [Mobile engineer](https://wave.bamboohr.co.uk/jobs/view.php?id=6) 
Submission to [dev.careers@waveapps.com](dev.careers@waveapps.com). 

## Submission Instructions
1. Fork this project on github
1. Complete the project
1. Push all of your changes to your fork on github and submit a pull request. 
1. Email [dev.careers@waveapps.com](dev.careers@waveapps.com) 
Include your github username in your email (so we can match applicants with pull requests.)

## Project Description
The app shows a Wave user the products that they can charge for on their invoices. 

### What your application must do:

1. Retrieve the list of products for the given business ID
1. The list of products to the user in a list view when the app is launched.
1. Each item in the list view shows the product name and price

## Evaluation
Evaluation of your submission will be based on the following criteria. 

1. Did your application fulfill the basic requirements? Yes
1. Did you document the method for setting up and running your application? Yes
1. Did you follow the instructions for submission? Yes

## Implementation and Features:
1. Launch App: If no internet, toast shows a wanrning and render nothing, otherwise list of products is fetched based on BizID and TokenID
1. The whole JSONArray is retrieved once when app is launched, but show only product names and prices in currency format.
1. Show a dialog while fetching 
1. Add an JUnit Test 

## Setting:
Download and install APK file WaveAPI2\app\app-release.apk and run in your device
or
Clone this project and import into Android Studio and run