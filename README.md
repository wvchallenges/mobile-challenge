My name is Daniel Chiang, the mobile challenge project is developed in iOS using Swift 2.

GitHub User Name: danielch92
Built Target: iOS 9.3
Xcode Version: 7.3
OS X: El Captain 10.11.4 or newer
business_id: 89746d57-c25f-4cec-9c63-34d7780b044b
access_token: 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm

How to run: Open the XCode project on any Mac that runs El Captain 10.11.4 or newer. Click run to start the simulator (default iPhone 6). You shall see the list of products from Wave API listed. 


This simple app uses NSURLSession to retreieve data from the Wave API. When the result comes back, the app will check the status code from the HTTP response and only proceed to initialize the JSON object when the code is 200 (OK). This mechanism will prevent error if for example access_token has expired or arguments are missing in URL. Moreover, I've formatted the price with currency formatter so there is no hard coding of 2 decimal place plus the $ symbol. The extracted names and prices are stored in an array of custom struct: Product, which contains a name and a price member both in String type. The advantage of storing both data in string is that there is no type change required upon display. All I need is to assign the lable of the tableViewCell with the corresponding name and price. It makes the code cleaner, easier to read and modify in my opinion. And that is the implementation that I'm pround of.     