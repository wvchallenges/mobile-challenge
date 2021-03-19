import React from 'react';
import {View, StyleSheet, Text} from 'react-native';

export default function ListItems({data}) {
  return (
    <View style={styles.container}>
      <Text>{data.name}</Text>
      <Text>{`$${data.price}`}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginHorizontal: 20,
    padding: 20,
    flexDirection: 'row',
    justifyContent: 'space-between',
    borderWidth: 1,
  },
});
