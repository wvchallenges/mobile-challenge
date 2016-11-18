import React, { PropTypes } from 'react';
import { Text, View } from 'react-native';

const Product = ({ product }) => (
  <View>
    <Text>{product}</Text>
  </View>
);

Product.propTypes = {
  product: PropTypes.string,
};

export default Product;
