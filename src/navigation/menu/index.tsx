import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { createStackNavigator } from '@react-navigation/stack';

import HomeNavigator from 'navigation/home-navigator';
import routeNames from 'routes';

import { Colors, TypeScale } from 'styles';

const Stack = createStackNavigator();
const Tab = createBottomTabNavigator();

const tabBarOptions = {
  activeTintColor: Colors.Text.black13,
  labelStyle: {
    ...TypeScale.font.regular18,
  },
};

const TabNavigator = (): JSX.Element => (
  <Tab.Navigator tabBarOptions={tabBarOptions}>
    <Tab.Screen name={routeNames.HomeTab} component={HomeNavigator} />
  </Tab.Navigator>
);

const Menu = (): JSX.Element => (
  <Stack.Navigator headerMode="none">
    <Stack.Screen name={routeNames.Menu} component={TabNavigator} />
  </Stack.Navigator>
);

export default Menu;
