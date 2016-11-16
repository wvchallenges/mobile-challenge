# Implementation

I'm happy with this implementation because I did my best to restrict myself from
using third party libraries such as Retrofit and/or RxJava to do the async portions
of the application. They were done using just AsyncTask as well as HttpUrlConnection.
So without Proguard the application should be pretty lean without RxJava and Retrofit.
Also I am happy with how the MVP structure worked out as it makes the code easier
manage in my opinion.