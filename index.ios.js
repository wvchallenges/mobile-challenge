/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import { AppRegistry, View, StyleSheet } from 'react-native';
import App from './app';

const styles = StyleSheet.create({
  wrapper: {
    paddingTop: 20,
  },
});

// eslint-disable-next-line react/prefer-stateless-function
export default class waveMobile extends Component {
  render() {
    return (
      <View style={styles.wrapper}>
        <App />
      </View>
    );
  }
}

AppRegistry.registerComponent('waveMobile', () => waveMobile);
