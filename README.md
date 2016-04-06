# Shawn's Development Challenge
The following is an amazing readme file outlining some of the interesting and/or exciting implementation details of the challenge as well as some basic instructions on how to get the project running on your machine. Also, it documents all the tests I should have wrote (haha).

## Project Setup Instructions
This project was developed using some external libraries to help keep development time less then an hour or two. In order to make package managment nice and easy, this project uses cocoapods. If you do not have cocoapods installed, you can click [here](https://guides.cocoapods.org/using/getting-started.html) for instructions on how to set it up! 

You must run the <strong>WaveProducts.xcworkspace</strong> file.

## Project Overview
This is the section where I outline some cool stuff I did.

#### Libraries Used
If you are overly curious you may have already looked at my Podfile. If not, the following libraries are what you will see in there:

1. <strong>AFNetworking</strong>
> AFNetworking was used for various reasons. The first is because other then proprietary networking libraries used on the job, I have the most experience with AFNetworking. Secondly, there are plenty of great features it includes out of the box in an easy to use manner. For example, the ability to cancel requests, AFHTTPRequestOperation distinguish between successful and unsuccessful requests based on HTTP status codes, and more.

2. <strong>JSONModel</strong>
> Not only has this library been very popular amoung iOS developers recently, but it also helps do the one thing many developers dislike doing; serializing JSON to be represented by our models. It also works the other way, so if you have lazy web developers who didn't make PATCH methods and only have PUT, you can easily create an object for updating.

3. <strong>POP</strong>
> I have a huge respect for what Facebook did with paper. I have used this library very minimally in the past but I love it's ease of use as well as it's beautiful easing curves, so I did what I could to show case it.

#### Some Other Notes
I used <strong>MVVM</strong> architecture. If I had more time I would have also included <strong>ReactiveCocoa</strong> in the mix to perfectly complement the architecture choice. The architecture is used because MVC, in my opinion, does not scale well to larger apps, but other architectures such as VIPER create too much over-head and boiler-plate for my liking. For times sake, I instead created some interfaces in which the views/view controllers would implement if using the view model in order to allow the view model to notify upon updates.

I also created a pretty neat intro animation. I really enjoy creating things that are somewhat visually appealing (though I am no designer) in order to give any apps I create that little bit of an edge on other apps. This specific type of animation also hides loading times so users can have a seamless experience.

<strong>Thanks!</strong>
> ~ Shawn
