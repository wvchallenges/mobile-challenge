## Project Description

In this project, we're creating a simple app that shows a Wave user the products that they can charge for on their invoices. 

The app uses the REST version of public Wave API. It appears to have been replaced with a GraphQL API, and the documentation for REST API is nowhere to be found.

The app has the business ID `89746d57-c25f-4cec-9c63-34d7780b044b` and a corresponding Wave API token `6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm` hard-coded into its implementation.

## Running the application

Open WaveProducts.xcodeproj with Xcode 10.1 (other versions might work as well).

Build WaveProduct scheme and run on any device or simulator with iOS 11 or newer.

## What the application does

1. The app retrieves the list of products for the specific business ID.
1. The list of products is fetched and shown to the user in a table view when the app is launched.
1. Each row in the table view shows the product name and price (formatted as a US dollar amount.)
1. The user can refresh the list with a button in top right corner.

If the list of products fails to load (e.g. there is no Internet connection) the app displays error message in place of the list and prompts the user to retry.

Apart from that the app does not implement any other interactivity.

## Notable features

1. The app is built with Swift 4.2 and storyboards.
1. No third-party libraries are used.
1. The app can be run on both iPhone and iPad and supports all device orientatons.
1. The app uses AutoLayout with automatic cell height.
1. Long product names can span across multiple lines.
1. Font size reflects DynamicType preference and is updated at run-time.
1. All UI elements can be accessed with VoiceOver.
1. In case Wave API returns and error response the UI displays the message from the response.
1. Price is stored and parsed as Decimal (rather than Double) to avoid rounding errors.
1. While the list of products is being loaded the app displays placeholder UI.
1. The placeholder UI also reflects current DynamicType preference.

## Author

Vadim Yelagin

vadim.yelagin@gmail.com

https://www.linkedin.com/in/yelagin/

https://github.com/Vadim-Yelagin
