import React, { PropTypes } from 'react';
import { Text, View } from 'react-native';

const Product = ({ product }) => (
  <View>
    <Text>{product.name}</Text>
  </View>
);

Product.propTypes = {
  product: PropTypes.object,
};

export default Product;
