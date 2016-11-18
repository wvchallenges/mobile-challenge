import React, { PropTypes } from 'react';
import { Text, View } from 'react-native';
import styles from './styles';

const Product = ({ product }) => (
  <View style={styles.wrapper}>
    <Text style={styles.name}>{product.name}:</Text>
    <Text style={styles.price}>${product.price ? product.price.toFixed(2) : 'nan'}</Text>
  </View>
);

Product.propTypes = {
  product: PropTypes.object,
};

export default Product;
