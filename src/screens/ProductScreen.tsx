import React from 'react';
import {
  ActivityIndicator,
  FlatList,
  RefreshControl,
  SafeAreaView,
  StatusBar,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import useSWR, {useSWRConfig} from 'swr';
import {productFetcher} from '../api/api';
import {Product} from '../api/models/Product';

const ProductScreen = () => {
  const {data, error, isValidating} = useSWR('/products/', productFetcher);

  const {mutate} = useSWRConfig();

  const onRefresh = React.useCallback(() => {
    mutate('/products/');
  }, []);

  const renderItem = ({item}: {item: Product}) => (
    <TouchableOpacity
      style={{
        flexDirection: 'column',
        backgroundColor: 'cornflowerblue',
        borderRadius: 8,
        marginTop: 8,
        padding: 16,
      }}
      onPress={() => {
        console.log(`Clicked product : ${item.name} ${item.id}`);
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
            {`$${item.price.toFixed(2)}`}
          </Text>
        </View>
      </View>
      <Text
        style={{
          fontSize: 20,
        }}>
        {item.description}
      </Text>
    </TouchableOpacity>
  );

  return (
    <SafeAreaView
      style={{
        flexDirection: 'column',
      }}>
      <StatusBar />
      {!data && isValidating ? <ActivityIndicator size="large" /> : null}
      {error ? (
        <Text
          style={{
            fontSize: 24,
            color: 'red',
          }}>
          {'API error'}
        </Text>
      ) : null}
      <FlatList
        style={{
          paddingHorizontal: 8,
        }}
        data={data ?? []}
        renderItem={renderItem}
        refreshControl={
          <RefreshControl refreshing={isValidating} onRefresh={onRefresh} />
        }
      />
    </SafeAreaView>
  );
};

export default ProductScreen;
