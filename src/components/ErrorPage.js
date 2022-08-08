import React from 'react';
import {Image, Text, View} from 'react-native';
import styles from '../screens/Products/styles';
import {HEIGHT} from '../utils/constants';

const ErrorPage = ({message}) => {
  return (
    <View style={styles.netView}>
      <Image
        source={require('../assets/images/error.jpg')}
        style={{
          height: HEIGHT * 0.3,
          marginTop: 90,
        }}
        resizeMode="contain"
      />
      <Text
        style={[
          styles.header,
          {fontSize: 18, paddingTop: 80, textAlign: 'center', lineHeight: 32},
        ]}>
        Oops!{'\n'}
        {message}
      </Text>
    </View>
  );
};

export default ErrorPage;
