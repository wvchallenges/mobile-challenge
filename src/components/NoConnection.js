import React from 'react';
import {Image, Text, View} from 'react-native';
import styles from '../screens/Products/styles';

const NoConnection = () => {
  return (
    <View style={styles.netView}>
      <Image
        source={require('../assets/images/noInternet.png')}
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
  );
};

export default NoConnection;
