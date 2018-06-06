# Wave Software Development Challenge

For this challenge, I have created an iOS application using Swift that fetches the products data from the provided API and displays it in a TableView.

You can directly clone or download the project and run it on Xcode.

There are few notable parts of the application. One is Network Manager Class, which contains the network api call methods (in this case, just the getProducts method) and returns the fetched data to the controller within a closure. This network manager class could also have been created a singleton instead of static, but in this case where its just about calling API, we dont need singleton. Another notable part of the application is where the data is being returned to the view controller in the closure. There could have been a retain cycle in the closure which I have stopped from happening by passing a weak referece to the viewcontroller. Another notable part is that the values are being read from the api object very safely using nil coalescing (??) and conditonal unwrapping.

I haven't used MVVM design pattern in this project because this was a fairly simple task but in real case scenarios and large scale applcations, I would use MVVM pattern for coding.
