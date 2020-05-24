import React, { useState, useEffect, useCallback, useContext } from 'react';
import {View, StyleSheet, FlatList, SafeAreaView, TouchableOpacity, ScrollView, RefreshControl, Text, Button} from 'react-native';
import NetInfo from "@react-native-community/netinfo";

import OfflineBanner from '../../components/core/offline'
import { axiosInstance as api} from '../../api'
import { UserContext } from '../../../App'
import { BUSINESS_ID } from '../../constants'
import COLORS from '../../styles/colors'
import { formatCurrency } from '../../utils/helpers'

function Item({ id, title, price }) {
  return (
    <TouchableOpacity
      onPress={() => {}}
      style={[styles.item]}
    >
      <View style={styles.listItemView}>
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.title}>{formatCurrency(price)}</Text>
      </View>
    </TouchableOpacity>
  );
}



const Products = (props) => {
  const user = useContext(UserContext);
  const [products, setProducts] = useState(null)
  const [refreshing, setRefreshing] = useState(false)
  const [isconnected, setIsconnected] = useState(false)
  const [businessId, setBusinessId] = useState(BUSINESS_ID);

  useEffect(() => {
    const unsubscribe = NetInfo.addEventListener(state => {
        setIsconnected(state.isConnected);
      });
      return () => {
        // Clean up
        unsubscribe();
      };
  })

  useEffect(() => {
    if (!products) {
      getProducts()
    }
  }, [products])

const _onRefresh = () => {
    setRefreshing(true);
    getProducts(() => { setRefreshing(false);})
}

const getProducts = (callback) => {
    api.get(`/businesses/${businessId}/products/`, { headers: { Authorization: user && user.authtoken}})
      .then(response => {
        if (response && response.data) {
          setProducts(response.data);
        }
      })
      .catch(ex => {
        //exception handling;
        setProducts([]);
      })
    callback && callback();
    
}
  return (
    <SafeAreaView>
        {
            isconnected ? (
                <ScrollView
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={() => _onRefresh()} title={'Refreshing the products list'}/>
        }
      >
          <View style={styles.mainView}>
        <FlatList
          data={products || []}
          renderItem={({item, index}) => (
            <Item
            title={item.name}
            price={item.price}
            id={item.id}
          />
          )}
        // ItemSeparatorComponent={() => {}}
          keyExtractor={item => item.id}
        />
        </View>
        </ScrollView>
            ) : <OfflineBanner/>
        }
      
      </SafeAreaView>
  )

}

export default Products

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 10,
    borderColor: COLORS.TRANSPARENT
  },
  mainView: {
    backgroundColor: COLORS.GRAY_1
  },
  item: {
    backgroundColor: COLORS.WHITE,
    elevation: 1,
    padding: 20,
    marginVertical: 8,
    marginHorizontal: 16,
  },
  listItemView: {
    flexDirection: 'row', 
    alignItems: 'flex-start', 
    justifyContent: 'space-between'
  },
  title: {
    fontSize: 20,
  },
});
