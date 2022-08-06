import React, {useState, useEffect, useCallback} from 'react';
import {Text, View, SafeAreaView, FlatList} from 'react-native';
import {renderLoader} from '../../components/loader';
import axios from 'axios';
import styles from './styles';

export default function ProductList({navigation}) {
  const [isLoading, setLoading] = useState(false);

  const [productList, setProductList] = useState([]);

  useEffect(() => {
    const apiURL =
      'https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/';
    const accessToken = '6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm';
    try {
      axios
        .get(apiURL, {
          headers: {
            Authorization: `Bearer ${accessToken}`,
          },
        })
        .then(res => {
          // console.log(res.data);
          setProductList(res.data);
        })
        .catch(error => {
          console.error(error);
        });
    } catch (error) {
      console.error(error);
    }
  }, []);

  const ItemRender = ({item}) => (
    <View style={styles.listView}>
      <Text> {item.name} </Text>
      <View>
        <Text> {item.price} </Text>
      </View>
    </View>
  );

  return (
    <SafeAreaView style={styles.container}>
      {isLoading && renderLoader()}
      {productList && (
        <FlatList
          data={productList}
          renderItem={({item}) => <ItemRender item={item} />}
          keyExtractor={item => item.id}
        />
      )}
    </SafeAreaView>
  );
}
