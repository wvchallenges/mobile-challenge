import React from 'react';
import {createStackNavigator} from '@react-navigation/stack';

import routes from './routes';
import Products from '../screens/Products';

export default function RootStackNav() {
  const screenOptions = {
    cardOverlayEnabled: false,
    headerStyle: {
      elevation: 1,
      shadowOpacity: 0,
    },
    headerBackTitleVisible: false,
    headerTitleStyle: {
      fontWeight: 'bold',
    },
    headerTitleAlign: 'center',
  };
  const Stack = createStackNavigator();

  return (
    <Stack.Navigator screenOptions={screenOptions}>
      <Stack.Screen name={routes.PRODUCTS} component={Products} />
    </Stack.Navigator>
  );
}
