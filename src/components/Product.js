import React from 'react';
import {
  StyleSheet,
  Text,
  View,
} from 'react-native';
import Colors from '../styles/Colors';

const Product = ({product}) => {
  return (
    <View style={styles.outerContainer}>
      <View style={styles.innerContainer}>
        <Text style={styles.nameText}>{product.name}</Text>
        <Text style={styles.priceText}>{`$${product.price}`}</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  innerContainer: {
    borderBottomWidth: 2,
    borderColor: Colors.waveDarkBlue,
    backgroundColor: Colors.waveMediumBlue,
    padding: 18,
    width: "100%",
    flexDirection: "row",
    justifyContent: "space-between"
  },
  outerContainer: {
    alignItems: "center"
  },
  nameText: {
    color: Colors.white,
    fontSize: 24
  },
  priceText: {
    color: Colors.white,
    fontSize: 24
  },
});

export default Product;
