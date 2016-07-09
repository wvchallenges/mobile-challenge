import React, { Component, PropTypes } from 'react'
import {
  View,
  Text,
  StyleSheet
} from 'react-native'

export default class ErrorOverlay extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.message}>
          {this.props.message}
        </Text>
      </View>
    );
  }
}

ErrorOverlay.propTypes = {
  message: React.PropTypes.string.isRequired
}

const styles = StyleSheet.create({
  container: {
    position: 'absolute',
    top: 0,
    right: 0,
    bottom: 0,
    left: 0,
    zIndex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#FFCCCB',
  },
  message: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  }
});
