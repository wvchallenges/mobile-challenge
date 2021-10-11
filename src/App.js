import React, { useEffect, useState } from 'react';
import {
  ActivityIndicator,
  FlatList,
  Image,
  SafeAreaView,
  StyleSheet,
  Text,
  View
} from 'react-native';
import Product from './components/Product';
import Colors from './styles/Colors';
import axios from 'axios';

const BUSINESS_ID = "89746d57-c25f-4cec-9c63-34d7780b044b"; // FIXME: Move this to `process.env` before release.
const ACCESS_TOKEN = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"; // FIXME: Move this to `process.env` before release.

const axiosWave = axios.create({
  baseURL: `https://api.waveapps.com/businesses/${ BUSINESS_ID }/`
});

axiosWave.defaults.headers.common['Authorization'] = "Bearer " + ACCESS_TOKEN;

const App = () => {
  const [isLoading, setIsLoading] = useState(true);
  const [products, setProducts] = useState([]);

  useEffect( () => {
    async function fetchProducts() {
      try {
        const response = await axiosWave('products/');
        setProducts(response.data);
      }
      catch(error) {
        setProducts([]);
        console.error(error);
      }
      finally {
        setIsLoading( false );
      }
    }

    fetchProducts();
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <View style={styles.logoContainer}>
          <Image source={require('./assets/wave_logo.png')} style={styles.logo}/>
        </View>
        <View style={styles.titleContainer}>
          <Text style={styles.titleText}>Products</Text>
        </View>
      </View>
      <View style={styles.listContainer}>
        { isLoading && (
          <View style={styles.activityIndicatorContainer }>
            <ActivityIndicator size="large" />
          </View>
        ) }
        <FlatList
          data={products}
          renderItem={({ item }) => <Product product={item} />}
          keyExtractor={item => item.id}
        />
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: Colors.white
  },
  header: {
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    borderBottomWidth: 1,
    borderColor: Colors.waveDarkBlue,
  },
  logoContainer: {
    position: "absolute",
    left: 0,
    top: 0
  },
  logo: {
    width: 88,
    height: 88
  },
  titleContainer: {
    alignItems: "center",
    paddingVertical: 20
  },
  titleText: {
    color: Colors.waveDarkBlue,
    fontSize: 40,
    fontWeight: "bold"
  },
  activityIndicatorContainer: {
    position: "absolute",
    top: 0,
    right: 0,
    bottom: 0,
    left: 0,
    justifyContent: "center",
    alignItems: "center"
  },
  listContainer: {
    flex: 1
  }
});

export default App;
