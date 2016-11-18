import React, { PropTypes } from 'react';
import { Text, View, StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  wrapper: {
    padding: 10,
    flex: 1,
    flexDirection: 'row',
  },
  name: {
    padding: 0,
  },
  price: {
    padding: 0,
  },
});

const Product = ({ product }) => (
  <View style={styles.wrapper}>
    <Text style={styles.name}>{product.name}</Text>
    <Text style={styles.price}>${product.price ? product.price.toFixed(2) : 'nan'}</Text>
  </View>
);

Product.propTypes = {
  product: PropTypes.object,
};

export default Product;
