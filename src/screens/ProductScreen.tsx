import React from 'react';
import {
  ActivityIndicator,
  FlatList,
  SafeAreaView,
  StatusBar,
  Text,
  View,
} from 'react-native';
import useSWR from 'swr';
import {productFetcher} from '../api/api';
import {Product} from '../api/models/Product';

const ProductScreen = () => {
  const {data, error} = useSWR(
    ['/products/', '89746d57-c25f-4cec-9c63-34d7780b044b'],
    productFetcher,
  );

  const renderItem = ({item}: {item: Product}) => (
    <View
      style={{
        flexDirection: 'column',
        backgroundColor: 'cornflowerblue',
        borderRadius: 8,
        marginTop: 8,
        padding: 16,
      }}>
      <View
        style={{
          flexDirection: 'row',
        }}>
        <Text
          style={{
            fontSize: 24,
            flex: 1,
          }}>
          {item.name}
        </Text>
        <View
          style={{
            borderRadius: 4,
            backgroundColor: 'orange',
            padding: 4,
          }}>
          <Text
            style={{
              fontSize: 20,
            }}>
            {`$${item.price}`}
          </Text>
        </View>
      </View>
      <Text
        style={{
          fontSize: 20,
        }}>
        {item.description}
      </Text>
    </View>
  );

  return (
    <SafeAreaView
      style={{
        flexDirection: 'column',
      }}>
      <StatusBar />
      {!data && !error ? <ActivityIndicator size="large" /> : null}
      <FlatList
        style={{
          paddingHorizontal: 8,
        }}
        data={data ?? []}
        renderItem={renderItem}
      />
    </SafeAreaView>
  );
};

export default ProductScreen;
