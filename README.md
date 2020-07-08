# Wave Challenge 
I tackled this challenge in three different ways to show my flexibility in creating UI components.
1. Classic UITableView with tableView delegates and tableView datasources
2. ListView coming out with iOS 14 which also includes new ways of registering cells and datasources.
3. SwiftUI

## Architecture
1. Classic UITableView
 - The classic UITableView goes with an MVC pattern. With not much UI configuration, I opted on making this in a normal MVC pattern and a networking service.
2. ListView
 - The listView is a new pattern being pushed by Apple that resembles what an MVVM would look like. All changes on the UI are pushed through `UICollectionLayoutListConfiguration`
3. SwiftUI
 - The SwiftUI pattern consists of the model, a store, a view and a service.
 
## Things I'm particularly proud of
If I weren't to keep backwards compatibility in mind, I'd love to keep creating mobile apps specifically using SwiftUI or the ListView. It's very obvious how Apple is trying to deprecate UITableView. A lot of these UI are faster to create, enforces componentability and has clear separation of responsibilities. 

## Things to Note:
I personally took this approach in it's simplest form. As per any project, I create the project while thinking what the best tool to use in a way where it's easy to collaborate in and simple to create. I personally think that code architecture is just another tool in a developer's toolset and given the project, I thought that a simple MVC pattern will suffice. If the app was much bigger and had a lot more dynamic content, an MVVM pattern would've made sense to use (in terms of classing UITableView pattern). 

