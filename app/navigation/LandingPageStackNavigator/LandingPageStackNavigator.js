import { createStackNavigator } from 'react-navigation';
import { LandingPage } from '../../screens';

const LandingPageStackNavigator = createStackNavigator(
	{ LandingPage },
	{
		headerMode: 'none'
	}
);

export default LandingPageStackNavigator;
