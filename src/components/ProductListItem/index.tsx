import React from 'react';

import { Text, View } from 'react-native';

import styles from './styles';

interface Props {
  name: string;
  price: string;
}

const ProductListItem = ({ name, price }: Props): JSX.Element => (
  <View style={styles.container}>
    <Text style={styles.text}>{name}</Text>
    <Text style={styles.text}>{price}</Text>
  </View>
);

export default ProductListItem;
