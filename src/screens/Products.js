import React, {useEffect} from 'react';
import {View, StyleSheet, FlatList} from 'react-native';
import {useDispatch, useSelector} from 'react-redux';
import ListItems from '../components/home/ListItems';

import {loadProducts} from '../store/reducers/products';

export default function Products({route, navigation}) {
  const dispatch = useDispatch();
  const products = useSelector(state => state.products.list);

  useEffect(() => {
    dispatch(loadProducts());
  }, []);

  return (
    <View style={styles.container}>
      <FlatList
        data={products}
        renderItem={({item}) => <ListItems data={item} />}
        ItemSeparatorComponent={() => <View style={styles.seperator} />}
        keyExtractor={(_, index) => index.toString()}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    paddingBottom: 40,
  },
  seperator: {
    marginBottom: 20,
  },
});
