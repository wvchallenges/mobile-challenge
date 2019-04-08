## Project Description

This project contains a single screen that displays a list of items that are gradually loaded in chunks from the local database and triggers a network call when the user scrolls and reaches the end of the available data in the database.

With this approach, it provides the best user experience as the cached content is always available on the device even without internet connection.

## Data Flow
![Screenshot](https://github.com/karlptrck/mobile-challenge/blob/master/data_flow_diagram.png)
[Screenshot Source](https://www.youtube.com/watch?v=QVMqCRs0BNA)

## Libraries Used

The app leverages on some of the modern Android Architecture components as follows :

- Room Database
- Paging
- LiveData
- ViewModel
- Retrofit
- Anko Commons

## How to setup
1. Clone or download this repository.
2. Replace the Wave API Key and Business ID with your own by updating your machine level gradle.properties (/Users/username/.gradle/gradle.properties). If the file doesn't exist, create one.
3. Build and Run!

## Testing
Download and install app-debug.apk
