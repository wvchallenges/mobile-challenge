import React from 'react';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import ProductList from '../screens/Products/ProductList';

const Stack = createNativeStackNavigator();

function StackNav() {
  return (
    <Stack.Navigator>
      <Stack.Screen
        name="ProductList"
        component={ProductList}
        options={{title: 'Product List'}}
      />
    </Stack.Navigator>
  );
}

export default StackNav;
