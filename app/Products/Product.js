import React, { PropTypes } from 'react';
import { Text, View, StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  wrapper: {
    padding: 50,
    flex: 1,
    flexDirection: 'row',
  },
  name: {
    padding: 1,
  },
  price: {
    padding: 1,
  },
});

const Product = ({ product }) => (
  <View style={styles.wrapper}>
    <Text style={styles.name}>{product.name}</Text>
    <Text style={styles.price}>{product.price}</Text>
  </View>
);

Product.propTypes = {
  product: PropTypes.object,
};

export default Product;
