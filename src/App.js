/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import { SafeAreaView, View, StatusBar } from 'react-native';
import ProductsList from './components/productsList';

const App = () => {
  return (
    <View>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <ProductsList />
      </SafeAreaView>
    </View>
  );
};

export default App;
