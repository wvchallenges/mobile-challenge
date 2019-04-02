import { StyleSheet } from 'react-native';
import { metrics } from '../../themes';

export default StyleSheet.create({
	outterContainer: {
		flex: 1,
		flexDirection: 'column',
		justifyContent: 'flex-start',
		paddingHorizontal: metrics.marginHorizontal,
		paddingTop: 10,
		paddingBottom: 20
	}
});
