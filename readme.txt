# Wave Software Development Challenge Summary

###Running this Android Application.
This application has been written using Android Studio and AndroidSDK. 
To open and run this application:
 1) In Android Studio, File --> Open.
 2) Select the WaveMobileChallenge folder.
 3) Then Run button (green play icon) in the top toolbar.


My implementation for this app is pretty, all of main app functions are done in 
a single activity (MainActivity). All the HTTP requests are done using Android 
Asynchronous Http Client (http://loopj.com/android-async-http/) library to make 
the code simpler. ListView widget is used to display the list of products and the
reasoning for using ListView is because when there are a lot of products to display
and there is scrolling involved, ListView was implemented in a way that for those
products not in view (on screen) it would be stored in memory. So it's already efficiently 
handled in those cases without having to create my own custom listview.

When the application has started, it checks if there is a data connection. If there isn't,
then a SnackBar will appear with a retry button. The retry button will just check again
if there is internet connection. If there is data, then it will check if the access token
is working using the https://api.waveapps.com/use endpoint (did this for fun). If it checks 
out, it will use the /businesses/{business_id}/products/ endpoint to get the list of products.

