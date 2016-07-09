import React, { Component } from 'react'
import {
  View,
  Navigator,
  StyleSheet,
  Platform
} from 'react-native'
import { connect } from 'react-redux'
import Products, { NavigationBarRouteMapper } from './Products'

class App extends Component {
  render() {
    return (
      <Navigator
        navigator={this.props.navigator}
        dispatch={this.props.dispatch}
        renderScene={this.renderScene.bind(this)}
        navigationBar={
          <Navigator.NavigationBar style={{backgroundColor: '#54C7C3'}}
            routeMapper={NavigationBarRouteMapper} />
        }
      />
    );
  }

  renderScene(route, navigator) {
    return (
      <View style={styles.container}>
        <Products />
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    marginTop: (Platform.OS === 'ios') ? 64 : 54,
    flex: 1
  }
})

export default connect()(App)
