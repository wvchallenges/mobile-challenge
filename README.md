# Wave Software Development Challenge


# App Implementation details:

1. The App  supports iPhone Portrait mode only
2 .The App  supports different screen sizes of iPhone 
3.The App requires internet connection to retrieve products 
4. While the app is checking for the internet connection and loading products, you can see activity indicator to indicate that a task is in progress
5.In case there is no Internet connection, the app displays the status saying "Internet Not Available!” so the user is aware what exactly the problem is. 
6. If the web service is down or unreachable, the app displays the status saying "Could not retrieve products!" so the user is aware of whats wrong.
7. I’ve implemented the custom table view cell that enables displaying the products in neat organized manner and can be used to display additional information if required without getting into the detail view.
8. I’ve defined the constants in the code for the important URLS and the dictionary keys so as to reduce the risk of alteration.
9. The code is well commented and has pragma marks to divide code into logical sections thus making it easy to read through the code and also adding visual cues to Xcode source navigator.
10. The App supports iOS version 9.3 or greater

# How to run the project:

1. Open the “Wave Technical Challege.xcodeproj” file using Xcode 
2. Run the project by selecting the iPhone simulator having iOS version 9.3 or greater
3. Provided you have internet connection, the App will run and you can see the products and their prices else it will display status message saying "Internet Not Available!”