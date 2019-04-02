import React, { Component } from 'react';
import { UIManager, Platform, View } from 'react-native';
import { Provider } from 'react-redux';
import AppNavigator from './app/navigation/AppNavigator/AppNavigator';
import { NetworkBar } from './app/containers/';
import { store } from './app/store/store';

import './app/config';

if (Platform.OS === 'android') {
	UIManager.setLayoutAnimationEnabledExperimental &&
		UIManager.setLayoutAnimationEnabledExperimental(true);
}

export default class App extends Component {
	render() {
		return (
			<Provider store={store}>
				<View style={{ flex: 1 }}>
					<NetworkBar />
					<AppNavigator />
				</View>
			</Provider>
		);
	}
}
