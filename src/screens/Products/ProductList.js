import React, {useState, useEffect, useCallback} from 'react';
import {
  Text,
  View,
  SafeAreaView,
  FlatList,
  RefreshControl,
  Image,
  Platform,
} from 'react-native';
import {renderLoader} from '../../components/loader';
import axios from 'axios';
import styles from './styles';
import {checkInternetConnection, currencyDisplay} from '../../utils/helper';
// import NetInfo from '@react-native-community/netinfo';
import Toast from 'react-native-simple-toast';
import {getAPI} from '../../services/api/apis';

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

    //check if there is internet connection
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
      } catch (error) {
        console.error(error);
      }
    }
  }, []);

  // const checkInternetConnection = () => {
  //   return new Promise(resolve => {
  //     NetInfo.fetch()
  //       .then(state => {
  //         resolve(
  //           state.isConnected &&
  //             (Platform.OS === 'android' ? state.isInternetReachable : true),
  //         );
  //       })
  //       .catch(e => {
  //         console.log(e);
  //         resolve(false);
  //       });
  //   });
  // };

  //Pull to refresh functionality
  const onRefresh = useCallback(async () => {
    setRefreshing(true);
    loadDataCallback();
  }, [refreshing]);

  const ItemRender = ({item}) => (
    <View style={styles.listView}>
      <View style={{flex: 1, justifyContent: 'center'}}>
        <Text> {item.name} </Text>
      </View>
      <View style={{flex: 0.5, justifyContent: 'center'}}>
        <Text style={{textAlign: 'right'}}>
          {currencyDisplay('en-CA', item.price)}
        </Text>
      </View>
    </View>
  );

  return (
    <SafeAreaView style={styles.container}>
      {isLoading && renderLoader()}
      {!connection && (
        <View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
          <Image
            source={require('../../assets/images/noInternet.png')}
            style={{width: 250, height: 250}}
            resizeMode="center"
          />
          <Text style={[styles.header, {paddingTop: 80}]}>
            Looks like you're offline!
          </Text>
          <Text style={[styles.header, {paddingTop: 10}]}>
            Check your connection.
          </Text>
        </View>
      )}
      {connection && (
        <FlatList
          data={productList}
          renderItem={({item}) => <ItemRender item={item} />}
          keyExtractor={item => item.id}
          refreshControl={
            <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
          }
        />
      )}
    </SafeAreaView>
  );
}
