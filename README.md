# mobile-challenge
This application retrieves the list of products for a specific business ID 
  > Then lists all the products to the user with the product name and price formatted in a dollar amount (Assuming that they're dollar, no cents)

### About My Implementation
For months of March and April, I have been really busy with 6 courses and managing 3 courses as teaching assistant. As a result, I delayed in starting the code challenge and also didn't have much time building this application. Even though I am proficient with both Python and Java, I decided to use Python to build it with a view for Mobile. The main reason is that I had to reinstall my laptop and didn't get the chance to install Android Studio or SDK. I started downloading it but it is 1.6gb large and my internet speed is running at tortoise speed. Second reason is that I didn't want to spend too much time worrying about Java syntaxes and restrictions. However, if you require me to do it in Java, please let me know and I will build an Android application using Java. I am truly capable of doing that. It's just I only have 2-3 hours of free time. I am working on this in between my other course work.

If I had more time, I would have done it using: https://kivy.org/planet/
It is a great platform for developing Android applications using Python. 

At first, I thought of creating an object modal for products. Then I realized that it was unnecassary with Python, where I could just convert the dictionary data into an object itself. However, for Java, I would basically populate the data into the object and create an instance. 

I didn't worry about any sanity check, assuming that, product endpoints get request will give me the right data. 

I am proud of my implementation because:
- This implementation is built based on MVC design pattern. 
  - Controllers: @app.route is associated with Controller function, specifically a function, known as a controller action. When the user enters the URL, the application looks for a matching route and calls that route's associated controller action. 
  - Models: Within the controller action, the Model is used to collect data from the Product Endpoint request as a data structure (Json->List of Dictionaries, in this case) and passed to view in an appropriate structure (object in this case).
  - Views: View accesses the data and uses the information to render HTML content of the page that user sees at the end using Jinja2.
- I saved unnecessary hassle of converting JSON into a different data structure then populating that into an instance of product object by directly converting JSON->dictionary elements into an Object
- My implemented solution is organized and easy to understand
- This implementation can be viewed on the laptop or phone

PS: If you want me to do something more than just this, please let me know. 


#### Requirements
- Install Python from: https://www.python.org/downloads/
- Install Flask from shell/command prompt: pip install flask
- Install requests from shell/command prompt: pip install requests

#### Running The App:
- Download this repository
- Go to solution folder
  - Using shell/command prompt > python runserver.py
  - Using IDE: Open runserver.py and run it
- You should see the following > * Running on http://127.0.0.1:8000/ (Press CTRL+C to quit)

#### Viewing The App:
- Go on your Internet Browser (Google Chrome is recommended)
- Type: http://127.0.0.1:8000/ and hit enter
- This should give you a Desktop View
- Now for the Mobile View:
  - Press F12
  - For Chrome: Click on Toggle Device Mode or Press Ctrl+Shift+M
    - Select any device from the option from Responsive dropdown
  - For Firefox: Click on Responsive Mode
    - Select a resolution below 1020 for ipad and between 320 to 760 for mobile devices
