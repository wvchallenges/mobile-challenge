This project is a simple iOS app that pulls data from the products endpoint of the Wave Public API. It displays a list of products and corresponding prices. The implementation uses a background thread to pull data, guarding against a slower internet connection. In addition, product price information is displayed in a locale-sensitive format - the currency sign and number formatting will reflect that of the locale set on the iOS device.

To run the app, simply open the project in xcode (alternatively, double-click the .xcodeproj file in the project directory) and hit Command+R


