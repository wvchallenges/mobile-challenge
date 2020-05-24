import React, { Component } from 'react';
import { Text, View, StyleSheet, FlatList, Platform, ActivityIndicator } from 'react-native';
import { ActionCreators } from '../actions';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import NetInfo from "@react-native-community/netinfo";
import Toast from 'react-native-simple-toast';
import { BUSINESS_ID, NO_INTERNET } from '../config/constants';
import Product from '../models/product';
import ProductItem from '../components/ProductItem';
import HomeState from '../store/state';


interface HomeProps {
  navigation: any,
  isLoading: boolean,
  isConnected: boolean,
  products: Product[],
  fetchProducts: any,
  setError: any,
  subscription: any,
  networkConnection: boolean,
  error: any
};

class HomeScreen extends Component<HomeProps, HomeState> {

  constructor(props: HomeProps) {
    super(props);
    this.state = { isLoading: false, products: [], error: "" };
  }

  componentDidMount() {
    //Check if internet is present
    this.fetchData();
  }

  fetchData() {
    let { fetchProducts, setError } = this.props;
    // Network info to check whether device is online or offline
    NetInfo.fetch().then( networkState => {
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
        {error ? <Text>{error}</Text>: null }
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


const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  activityIndicator: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    color: '#bc2b78',
    alignItems: 'center',
    justifyContent: 'center'
  },
  error: {
    color: 'red',
    fontSize: 16
  }
});


function mapStateToProps(state: any) {
  const { isLoading, error , products} = state.fetchProducts;
  return { isLoading, products, error };
}

function mapDispatchToProps(dispatch: any) {
  return bindActionCreators(ActionCreators, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(HomeScreen);