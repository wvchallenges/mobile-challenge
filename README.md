# Wave Software Development Challenge
I created this application with react-native-cli using the code below:

```bash
$ react-native init Wave
```

### Network Checking
For checking network connection I used [@react-native-community/netinfo](https://github.com/react-native-netinfo/react-native-netinfo). I used NetInfo in a function named [isNetworkConnected](https://github.com/Masoooud/mobile-challenge/blob/master/src/helpers/isNetworkConnected.js)

### HTTP Request
For the http request, I used [Axios](https://github.com/axios/axios). It's easy to use and easy to implement.

Also, I created a function named [Api](https://github.com/Masoooud/mobile-challenge/blob/master/src/helpers/service/index.js) to handle HTTP headers, Authentication of API calls.

### Testing 
I used jest for testing this application. Because I used @react-native-community/netinfo in my application and it's a native component jest doesn't work. So I created [jest.setup.js](https://github.com/Masoooud/mobile-challenge/blob/master/jest.setup.js) so I could run my tests.

### What I'm Proud of
- I used the simplest package to create an application. This helps to avoid the installation of some unnecessary packages and also to keep app size as lower as I can.
- My folder hierarchy is very understandable and easy to follow up.
- I uses latest js technologies like React hooks and Arrow function.
