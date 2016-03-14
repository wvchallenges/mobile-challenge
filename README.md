
* 1. Your app must retrieve the list of products for the specific business ID sent to you by your Wave contact

Done!  I wrote the app in Objective C because I have about 10 years of experience
with it and wanted to get this done quickly. I added a nice little animated background for a little flare, plus rounded corners
on the UITableView and UIButtons.  The product list is downloaded on a background thread so the UI remains responsive.  There's a 
little "Please Wait" dialog that comes and goes during the downloading, and notice that UI stuff is done on the main thread like it 
should be.

The data is retained in an NSArray in its original form: an array of NSDictionary objects. For optimization, I would probably have an 
array of just what is needed in memory.  I would probably add a feature that lets the user sort by name, dollar amount, etc. I would
probably show the dollar amount in various currencies, too and use a Forex site to get the latest currency exchange rates.

I should add some error checking if the data is invalid or corrupt.

* 1. The list of products should be fetched and shown to the user in a list view when the app is launched.

Done!  Everything starts at viewDidLoad but if there's an error, a fake product is put into the array which reveals a "Retry" button
so the user can try again.  

* 1. Each item in the list view should show the product name and price (formatted as a dollar amount.)

Done.  I realize the dollar value is in Decimal format according to the documentation, but I used Double values.  I thought
the app would like nicer with a detailed description, so I added that too.  

* You are not required to add any interactivity to the app -- i.e. you do not need to send the user to a detail view when they touch one of the list items. 

Ok.

* Your app is allowed to render nothing if there is no internet connection when it loads.

Well, it adds a fake product with a description of the error and makes a Retry button visible

