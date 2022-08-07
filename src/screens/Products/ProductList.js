import React, {useState, useEffect, useCallback} from 'react';
import {SafeAreaView, FlatList, RefreshControl} from 'react-native';
import {renderLoader} from '../../components/loader';
import styles from './styles';
import {checkInternetConnection} from '../../utils/helper';
import Toast from 'react-native-simple-toast';
import {getAPI} from '../../services/api/apis';
import {ListView, NoConnection} from '../../components';

export default function ProductList({navigation}) {
  const [isLoading, setLoading] = useState(false);

  const [productList, setProductList] = useState([]);
  const [refreshing, setRefreshing] = useState(false);
  const [connection, setConnection] = useState(true);

  useEffect(() => {
    loadDataCallback();
  }, [loadDataCallback]);

  const loadDataCallback = useCallback(async () => {
    setLoading(true);

    //check for internet connection
    const isConnected = await checkInternetConnection();

    if (!isConnected) {
      //Alert for the user to know they are in offline mode
      Toast.show("You're offline. Check your connection.", Toast.LONG);
      setConnection(false);
      setLoading(false);
      setRefreshing(false);
    } else {
      const endpoint = 'products/';
      try {
        const results = await getAPI(endpoint);
        setProductList(results);
        setLoading(false);
        setRefreshing(false);
      } catch (error) {
        console.error(error);
      }
    }
  }, []);

  //Pull to refresh functionality
  const onRefresh = useCallback(async () => {
    setRefreshing(true);
    loadDataCallback();
  }, [refreshing]);

  return (
    <SafeAreaView style={styles.container}>
      {isLoading && renderLoader()}
      {!connection && <NoConnection />}
      {connection && (
        <FlatList
          data={productList}
          renderItem={({item}) => <ListView item={item} />}
          keyExtractor={item => item.id}
          refreshControl={
            <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
          }
        />
      )}
    </SafeAreaView>
  );
}
