## Wave challenge

---
### Requirements

1. Your app must retrieve the list of products for the specific business ID sent to you by your Wave contact.
  * Complete.
* The list of products should be fetched and shown to the user in a list view when the app is launched.
  * On open, the app retrieves products and lists them in a recycler adapter. Also, the settings menu allows you to reset and get the products again
* Each item in the list view should show the product name and price (formatted as a dollar amount.)
  * Complete. Used BigDecimal and Currency for formatting of dollar amount

---
### Setting up and running the application

1. Install Android studio and dependancies (JDK etc)
* Create new project and import the source
* Allow gradle to build and download dependancies (Retrofit, RxJava)
* Add an xml file to the res/values resource directory called secure
  * You need to add the following lines and also replace the {} with correct business ID.
  ```xml
  <?xml version="1.0" encoding="utf-8"?>
  <resources>
    <string name="bId">{BUSINESS_ID}</string>
  </resources>
  ```
* Create a VM or attach an Android device to the IDE
* Build and Run the application

---
### Pride

On a previous project I worked on where the original author of the project created all there REST and events by hand proved to be a large challenge for me to complete the project as part of the contract since the original author left the project. It would have been a massive undertaking to restructure a lot of how the app was built to use proven libraries like Retrofit and RxJava.

This was the first time I was able to implement RxJava instead of just reading about it and it's implementations. RxJava helps with async tasks and observable sequences. The alternative is using even busses or create objects not attached to the activity and manage them independently.
