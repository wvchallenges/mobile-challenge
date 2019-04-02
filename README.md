# README

## :arrow_up: How to Setup

**Step 1:** git clone this repo:

**Step 2:** cd to the cloned repo:

**Step 3:** add local .env file with following variables `API_URL` `BUSINESS_ID` `ACCESS_TOKEN`

**Step 4:** Install the Application with `yarn` or `npm i`

## :arrow_forward: How to Run App

1. cd to the repo
2. Run Build for either OS

# For Development

- for iOS
  - run `npm run ios`
- for Android
  - run `npm run android`

## App Info

> I implemented a Network bar dropdown that lets the user know when their device has disconnected. I utilized a native module within `react-native` called `NetInfo` to implement this.

> By utilizing the `RefreshControl` component within `react-native`, I also added a pull to refresh withi nthe product list to give user the control to poll more data whenever they like.
