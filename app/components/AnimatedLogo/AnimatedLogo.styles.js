import { StyleSheet } from 'react-native';
import { metrics } from '../../themes';

export default StyleSheet.create({
	container: {
		flex: 1,
		alignItems: 'center',
		justifyContent: 'center'
	},
	logo: {
		alignSelf: 'center',
		width: 1877 / 8,
		height: 681 / 8,
		marginBottom: metrics.marginVerticalPercentage(5)
	}
});
