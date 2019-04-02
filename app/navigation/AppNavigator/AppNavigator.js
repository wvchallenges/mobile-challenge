import { createSwitchNavigator, createAppContainer } from 'react-navigation';
import LandingPageStackNavigator from '../LandingPageStackNavigator/LandingPageStackNavigator';
import HomeStackNavigator from '../HomeStackNavigator/HomeStackNavigator';

const AppSwitchNavigator = createSwitchNavigator(
	{
		LandingPage: LandingPageStackNavigator,
		App: HomeStackNavigator
	},
	{
		initialRouteName: 'LandingPage'
	}
);

export default createAppContainer(AppSwitchNavigator);
