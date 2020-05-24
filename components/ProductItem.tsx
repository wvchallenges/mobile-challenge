import React,{ Component, useState, useEffect} from 'react';
import {Text, View, StyleSheet, TouchableOpacity} from 'react-native';
import styles from './ProductItem.style';
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
        <Text style={styles.title}> {product.description} </Text>
      </View>
    </TouchableOpacity>   
  )
}


export default ProductItem;