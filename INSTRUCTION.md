### Wave Coding Challenge README by Visaahan A.    

Didn't really do much with respect to designing the output to make it look nice and how it looks on the app. Hopefully that won't be an issue.    

So I didn't really know which language I wanted to build the application in. I defaulted to my most familiar languages in Java and Python but then I thought, since this was a mobile engineer position, I'll take this opportunity to demonstrate my mobile development skills, so I made an Android app.

The reason I am proud of this app is because I think I designed it to a point where it can be easily extendible to accomodate other requests (such as POST, PUT, etc.). It can also be extended to accomplish different tasks. It provides a very good foundation to build upon in future iterations, in my opinion. Furthermore, I tried to utilize the latest Android practises as best as possible. One of the latest Android developments is the introduction of Volley to do HTTP Requests. The great thing about Volley is you can make HTTP Requests on the UI thread for Android, whereas before you weren't able to and had to run separate threads to do HTTP Requests (asynctasks typically). The drawback is Volley does add an additional dependency, but it is worthwhile since it provides a lightweight library that makes HTTP Requests.   

####HOW-TO USE

So, I added the app folder in the github repository to avoid storing binary files for the android app and it does contained a modified build.gradle file. So basically create an Android app (preferably on Android Studio) and name it WaveCodingChallenge. Then replace the app folder with the one in the github repository and it should be good to run.




