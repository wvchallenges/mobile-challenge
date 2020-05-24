import React, { Component } from 'react';
import { Text, View, StyleSheet, FlatList, Platform, ActivityIndicator } from 'react-native';
import { ActionCreators } from '../actions';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import NetInfo from "@react-native-community/netinfo"; // NetInfo library is used for determining network connection
import Toast from 'react-native-simple-toast'; // Toast library for showing appropriate toast when 
import { BUSINESS_ID, NO_INTERNET } from '../config/constants';
import Product from '../models/product';
import ProductItem from '../components/ProductItem';
import HomeState from '../store/state';
import styles from './HomeScreen.style';

interface HomeProps {
  navigation: any,
  isLoading: boolean,
  products: Product[],
  fetchProducts: any,
  setError: any,
  error: any
};

class HomeScreen extends Component<HomeProps, HomeState> {

  constructor(props: HomeProps) {
    super(props);
    this.state = { isLoading: false, products: [], error: "" };
  }

  componentDidMount() {
    this.fetchData();
  }

  fetchData() {
    let { fetchProducts, setError } = this.props;
    // Network info to check whether device is online or offline
    NetInfo.fetch().then( networkState => {
      console.log('Network state is ',networkState.isConnected);
      if(networkState.isConnected) {
        fetchProducts(BUSINESS_ID);
      }else {
        Toast.show(NO_INTERNET);
        setError(NO_INTERNET);
      }
    });
    
  }

  render() {
    let { products, isLoading, error } = this.props;
    return (
      <View style={styles.container}>
        {error ? <Text style={styles.error}>{error}</Text>: null }
        <FlatList  data={products} keyExtractor={item => item["id"].toString()} renderItem={({ item }) =>
          <ProductItem product={item} />} />
        { isLoading ? <ActivityIndicator
          animating={isLoading}
          size="small"
          style={ styles.activityIndicator } /> : null }
      </View>
    );
  }

}

function mapStateToProps(state: any) {
  const { isLoading, error , products} = state.fetchProducts;
  return { isLoading, products, error };
}

function mapDispatchToProps(dispatch: any) {
  return bindActionCreators(ActionCreators, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(HomeScreen);