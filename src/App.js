/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, { useEffect, useState } from 'react';
import {
  SafeAreaView,
  StyleSheet,
  View,
  Text,
  StatusBar,
  FlatList,
  Dimensions,
} from 'react-native';
import { getProducts } from './services/products';

const { width, height } = Dimensions.get('window');

const App = () => {
  const [productslist, setProductsList] = useState([]);

  useEffect(() => {
    callApi();
  }, []);

  async function callApi() {
    const products = await getProducts();
    if (products !== false) {
      setProductsList(products);
    }
  }

  const renderProduct = ({ item }) => (
    <View style={styles.item}>
      <Text style={styles.title}>{item.name}</Text>
      <Text style={styles.price}>
        {item.price.toLocaleString('en-US', {
          style: 'currency',
          currency: 'USD',
        })}
      </Text>
    </View>
  );

  const header = () => (
    <View style={styles.headerContainer}>
      <Text style={styles.headerText}>Products</Text>
    </View>
  );
  return (
    <View>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <FlatList
          data={productslist}
          renderItem={renderProduct}
          keyExtractor={(item) => item.id.toString()}
          ListHeaderComponent={header}
        />
      </SafeAreaView>
    </View>
  );
};

const styles = StyleSheet.create({
  item: {
    width: width - 40,
    paddingHorizontal: 20,
    paddingVertical: 10,
    marginBottom: 20,
    marginHorizontal: 20,
    borderRadius: 6,
    borderWidth: 1,
    borderColor: '#c4c4c4',
  },
  title: {
    fontSize: 20,
    marginBottom: 16,
    fontWeight: 'bold',
  },
  price: {
    fontSize: 14,
  },
  headerContainer: {
    width: width,
    height: height / 4,
    justifyContent: 'center',
    paddingHorizontal: 30,
    backgroundColor: '#53CD8C',
    marginBottom: 20,
  },
  headerText: {
    fontSize: 50,
    fontWeight: 'bold',
    color: '#fff',
  },
});

export default App;
