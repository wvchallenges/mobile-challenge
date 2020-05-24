/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/react-native-community/react-native-template-typescript
 *
 * @format
 */

import React from 'react';
import {
  StyleSheet,
} from 'react-native';

import { Provider, connect } from 'react-redux';
import { createStackNavigator } from 'react-navigation-stack';
import { createAppContainer, createSwitchNavigator} from 'react-navigation';
import HomeScreen from './screens/HomeScreen';
import configureStore from './store';
import 'intl';
import 'intl/locale-data/jsonp/en';

const store = configureStore({});

const AppNavigator = createStackNavigator({
  Home: HomeScreen
},
{
initialRouteName: 'Home'
}

)
// React navigation to make navigation smoother in case we add additional screens
const Navigation = createAppContainer(AppNavigator);

const  App = ()=> {
  
  return (
    <Provider store={store}>
      <Navigation />
    </Provider>  
  );

}
const styles = StyleSheet.create({
  
});

export default App;
