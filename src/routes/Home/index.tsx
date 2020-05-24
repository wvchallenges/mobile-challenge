import React, { useEffect } from 'react';
import { FlatList, SafeAreaView, Text, View } from 'react-native';
import { useDispatch, useSelector } from 'react-redux';

import Actions from 'state/ui/home/actions';
import Selectors, { HomeProduct } from 'state/ui/home/selectors';

import ProductListItem from 'components/ProductListItem';
import Loading from 'components/Loading';
import Error from 'components/Error';

import strings from 'locales/home';

import styles from './styles';

const keyExtractor = (product: HomeProduct): string => `${product.id}`;

const productListItem = ({ item }: { item: HomeProduct }): JSX.Element => (
  <ProductListItem name={item.name} price={item.usPrice} />
);

const Home = (): JSX.Element => {
  const dispatch = useDispatch();
  const { products, error, loading } = useSelector(Selectors.getProducts);
  const hasData = products.length > 0;

  useEffect((): void => {
    dispatch(Actions.getProducts());
  }, [dispatch]);

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.screenHeader}>{strings.screenHeader}</Text>
      {loading && (
        <View style={styles.loadingContainer}>
          <Loading />
        </View>
      )}
      {!!error && (
        <View style={styles.errorContainer}>
          <Error />
        </View>
      )}
      {hasData && (
        <View style={styles.dataContainer}>
          <FlatList
            data={products}
            keyExtractor={keyExtractor}
            renderItem={productListItem}
            bounces={false}
          />
        </View>
      )}
    </SafeAreaView>
  );
};

export default Home;
