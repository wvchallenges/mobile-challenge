### How to run this app
##### Step 1
Run `npm install`. 

##### Step 2
Install <a href="https://facebook.github.io/react-native/" target="_blank">React Native</a> and follow the instructions for running a react native app on iOS or Android.

### My implementation
I am particularly proud of the code organization and quality.
Although its a small application, it could easily be extended by other team members as it follows familiar conventions
used in React and Redux.

The access token really shouldn't be included in this repository but I did include it simply because it made things easier. Usually
an access token like that would be retrieved after a user logs in.

The app provides the user with some feedback such as a loading screen when data is being read from the api and also an error screen
when something goes wrong while trying to fetch products. That way a user isn't left guessing when their iPhone is in airplane mode.
