
## Project Description
In this project, we're going to be creating a simple app that shows a Wave user the products that they can charge for on their invoices. 

You'll be using the public Wave API in this challenge. You can find the documentation [here](http://docs.waveapps.io/). You will specifically be interested in [the products endpoint](http://docs.waveapps.io/endpoints/products.html#get--businesses-business_id-products-), and [using an access token with the API](http://docs.waveapps.io/oauth/index.html#use-the-access-token-to-access-the-api). 

### What your application must do:

1. Your app must retrieve the list of products for the specific business ID sent to you by your Wave contact
1. The list of products should be fetched and shown to the user in a list view when the app is launched.
1. Each item in the list view should show the product name and price (formatted as a dollar amount.)

You are not required to add any interactivity to the app -- i.e. you do not need to send the user to a detail view when they touch one of the list items. 

Your app is allowed to render nothing if there is no internet connection when it loads.

## Implementation 
Solution was implemented using Swift 2.0. I used Alamofire HTTP networking library to pull the data from the Wave API asynchronously in a background thread. Also I used auto layout, so the UI should be compatible with all screen sizes and orientations. 

 

## Running the application
1. Do a 'pod install' from command line inside the folder to install the pod dependancies 
1. Click on WaveDevTest.xcworkspace to open the project using XCode
1. Compile and run the application using XCode
