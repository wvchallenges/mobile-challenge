import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';

import routeNames from 'routes';
import Home from 'routes/Home';

const Stack = createStackNavigator();

const homeNavigator = (): JSX.Element => (
  <Stack.Navigator headerMode="none">
    <Stack.Screen name={routeNames.Home} component={Home} />
  </Stack.Navigator>
);

export default homeNavigator;
