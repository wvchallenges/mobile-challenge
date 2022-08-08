import React from 'react';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import ProductList from '../screens/Products/ProductList';
import {COLORS} from '../components/colors';

const Stack = createNativeStackNavigator();

function StackNav() {
  return (
    <Stack.Navigator
      screenOptions={{
        headerTitleStyle: {
          fontWeight: 'bold',
          color: COLORS.blue,
          textAlign: 'center',
        },
      }}>
      <Stack.Screen
        name="ProductList"
        component={ProductList}
        options={{
          title: 'Products',
        }}
      />
    </Stack.Navigator>
  );
}

export default StackNav;
