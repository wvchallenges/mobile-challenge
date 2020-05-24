# Carlos Conejo's Wave Software Development Challenge

## Development Environment

### Requirements

1. [Xcode 11.5](https://developer.apple.com/xcode/resources/)
2. [NVM](https://github.com/creationix/nvm)
   - After installing NVM, install version 12.16.3 of node - `nvm install 12.16.3`
   - You can either set that version to your NVM's default alias - `nvm alias default 12.16.3` **OR** you can run `nvm use` each time you are going to work on the project to ensure you are on correct version of node.
3. [React Native](https://facebook.github.io/react-native/docs/getting-started) -> React Native CLI QuickStart

   - Follow instructions for both **iOS** and **Android** OS Targets - **NOTE:** I use **NVM** for managing **node** and **npm** versions. Skip the `brew install node` step in the docs and be sure you've followed the NVM installation instructions from the step above.

4. [Yarn](https://yarnpkg.com/en/docs/install)
5. [Bundler](https://bundler.io/) - `gem install bundler`
6. [Cocoapods](https://cocoapods.org/) - `gem install cocoapods -v 1.5.3`

### Setup

- Clone the repo
- Use/Install Node:

  `$ nvm use`

- Install dependencies:

  `$ yarn`

- Install iOS dependencies:

  `$ cd ios/ && pod install && cd..`

### Running the App

- Run on iOS simulator

  `$ yarn ios`

### Notes

- While there shouldn't be any reason this wouldn't run on Android, I did not run it on Android nor put together instructions to save some time
- I added react navigation and set up a small navigation system (tabs at the bottom) even though there is only one screen. It's a little weird but the idea is to treat this project as the basis for more work to be added on top of it, in this case, tabs/stacks/modals

## Major third-party tools

1. [typescript](https://www.typescriptlang.org/)
2. [react-navigation](https://reactnavigation.org/)
3. [redux](https://github.com/reduxjs/redux)
4. [redux-saga](https://github.com/redux-saga/redux-saga)

## Things I would do given more time

- Have pagination on the products
- Have more information in the Home page, for example, business information. That way I could have illustrated how to solve the problem of having two sources of data in the same page when one of them is paginated
- Have a system in place to `type` the incoming data from the API
- Set up environments along with other API constants instead of hardcoding the urls
- Not hardcoding the auth token but instead getting one on run-time
- Make it look prettier

## Things I'm most proud of

- The architecture in general, the separation of concerns as well as having utilities for common problems that help avoid code duplication like the `create-worker` function

## Final Notes

- I noticed that you have a GraphQL schema, the requirements said to use the REST version, but if allowed, I would have used Apollo Client to both manage the state and interact with your GraphQL interface. That would have also brought the benefit of auto-generating the typescript types off the remote GraphQL schema and allowing for an end to end typed data flow
- There are a lot of overkills in the way I set up the project, like Typescript, eslint, Redux/Saga, Workers, and react-navigation. But the idea was to treat it as if this was going to end up being a product we would be developing for months as part of a team
