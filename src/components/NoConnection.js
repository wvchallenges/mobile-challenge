import React from 'react';
import {Image, Text, View} from 'react-native';
import styles from '../screens/Products/styles';
import { HEIGHT } from '../utils/constants';

const NoConnection = () => {
  return (
    <View style={styles.netView}>
      <Image
        source={require('../assets/images/noInternet.png')}
        style={{height: HEIGHT * 0.3, marginTop: 90}}
        resizeMode="center"
      />
      <Text
        style={[
          styles.header,
          {fontSize: 18, paddingTop: 80, textAlign: 'center', lineHeight: 32},
        ]}>
        Looks like you're offline!{'\n'}
        Check your connection.
      </Text>
    </View>
  );
};

export default NoConnection;
