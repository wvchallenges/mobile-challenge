The purpose of this app is a simple code sample to pull a feed from the server, parse it, and draw it as a list of products.
It is a standard xcode app. There are no special instructions for setting up and running the application.

## Areas of the code to improve

1. the authorization and url could be abstracted from the NetworkManager to make it more flexible. Find a way to not hardcode tokens within the mobile app
2. There are duplicate named products in the feed. Decide on a way to deal with them. Product ID was included in the name to disambiguate as a temporary solution.
3. Make the UI nicer. Perhaps include a picture of the product.

