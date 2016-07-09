import React, { Component } from 'react'
import {
  View,
  Navigator
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
      <View style={{marginTop: 64, flex: 1}}>
        <Products />
      </View>
    )
  }
}

export default connect()(App)
