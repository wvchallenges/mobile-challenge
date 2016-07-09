import React, { Component, PropTypes } from 'react'
import {
  View,
  Text,
  StyleSheet
} from 'react-native'

export default class LoadingOverlay extends Component {
  constructor(props) {
    super(props)
    this.state = {
      ellipsis: '.'
    }
  }

  componentDidMount() {
    this._interval = setInterval(() => {
      var ellipsis = this.state.ellipsis
      ellipsis = ellipsis.length >= 3 ? '.' : ellipsis + '.'
      this.setState({ ellipsis })
    }, 200)
  }

  componentWillUnmount() {
    clearInterval(this._interval);
  }

  render() {
    const { message } = this.props
    return (
      <View style={styles.container}>
        {message ? (
          <Text style={styles.message}>
            {message}
          </Text>
        ) : null}

        <Text style={styles.ellipsis}>
          {this.state.ellipsis}
        </Text>
      </View>
    );
  }
}

LoadingOverlay.propTypes = {
  message: PropTypes.string
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
    backgroundColor: 'rgba(255,255,255,0.9)',
  },
  ellipsis: {
    fontSize: 70,
    textAlign: 'center'
  },
  message: {
    fontSize: 20,
    textAlign: 'center'
  }
});
