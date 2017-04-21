# Wave Software Development Challenge

This repository contains an iOS 10 application for Wave Software Development challenge.
Architecture of this app is using MVVM approach instead of regular MVC.

# Build instructions

This app uses Carthage as a way to pull third-party libraries.

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

Go to the directory with Cartfile and run

```
$ carthage update --platform iOS
```

## Requirements

- iOS 10.0+
- Xcode 8.1+
- Swift 3.0+

## Third-party libraries

App is using some libraries to simplify workflow. These are:
- [Alamofire](https://github.com/Alamofire/Alamofire/) for Networking.
- [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper) for Model object mapping.
- [Bolts-Swift](https://github.com/BoltsFramework/Bolts-Swift) for asyncronous tasks.

## Features

This app features an architecture that can easily be scaled to a more complex app easily.
Even though I'm using MVVM and create a lot of files, in the long run I end up saving time
when bug fixes or feature implementations come in.
All my View Models contain data specifically tailored for 1 type of View Controller.
View Controllers only manage Views and fill out the data coming from View Models.

In addition, my solution uses features of Swift language to restrict the way
API requests are created and processed. Each API request is an Enum with
a bunch of required properties (base url, path, parameters).
In case there is a need to introduce new API request, or make some changes to
the existing ones, Swift compiler will point to most of the trivial errors that
could occur. This improves reliability of provided approach comparing to other solutions.
