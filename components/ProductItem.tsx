import React,{ Component, useState, useEffect} from 'react';
import {Text, View, StyleSheet, TouchableOpacity, ActivityIndicator} from 'react-native';
import Utils from '../lib/utils';
import Product from '../models/product';

type Props = {
    product: Product
};

const ProductItem = ({product}: Props) => {
  return(
    <TouchableOpacity>
      <View style={styles.item}>
        <Text style={styles.title}> Name: {product.name}</Text>
        <Text style={styles.title}> Price: {Utils.getCurrencyFormat(product.price)}</Text>
      </View>
    </TouchableOpacity>   
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems:"center"
  },
  card: {
    flex: 1,
    justifyContent: 'space-between',
    height: 60
  },
  item: {
    backgroundColor: '#e3e3e6',
    padding: 20,
    marginVertical: 8,
    marginHorizontal: 16,
  },
  title: {
    fontSize: 20
  },
});

export default ProductItem;