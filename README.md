## How to setup the project

This project has no dependencies, therefore, the setup is simple.

1. Checkout the repository.
1. Check system requirements below to make sure you are running the correct xcode with the swift version toolchain installed.
1. Business id and access token have been removed from the source files. Upon building the project, you will get two errors complaining that there are placeholders in file. Replace the placeholders with your own business id and access token values. 
1. Build and run!

## What am I proud of in this implementation

I make sure to always write code in a way that I can be proud of every single line. If I were to choose, however, I'd choose the following in this project:

1. Simplicity in isolation of responsibility of different parts of the application. `Networking`  although provides the networking service in the simplest way, yet it can be improved to add complex functionality like handling timeouts and retires without affecting the current callers. The whole networking implementation can be replaced with a third party even without affecting teh rest of the application.
1. Testability. All units are easily testable with dependencies injectable either at initialization or later, with property injections. `ProductListViewModel` can be tested for correct state handling by injecting it with a mock `ProductListService` that returns mock data.
1. State based view handling allows for clear understanding of what is expected of the view in a certain state that makes maintenance and debugging easy. One can clearly see what should happen in the `ProductListViewController` while loading, when there are products available, and when there is an error.

## System Requirements

### Xcode version: 10.1
### Swift version: 4.2
