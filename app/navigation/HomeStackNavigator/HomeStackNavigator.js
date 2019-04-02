import React from 'react';
import { createStackNavigator } from 'react-navigation';
import StackViewStyleInterpolator from 'react-navigation-stack/dist/views/StackView/StackViewStyleInterpolator';

import { Home } from '../../screens';
import { Header } from '../../components';

const HomeStackNavigator = createStackNavigator(
	{ Home },
	{
		defaultNavigationOptions: () => ({
			header: <Header />
		}),
		mode: 'card',
		headerMode: 'screen',
		headerTransitionPreset: 'uikit',
		transitionConfig: () => ({
			screenInterpolator: sceneProps => {
				return StackViewStyleInterpolator.forHorizontal(sceneProps);
			}
		})
	}
);

export default HomeStackNavigator;
