import { StyleSheet } from 'react-native';
import { colors, fonts, metrics } from '../../../themes';

export default StyleSheet.create({
	container: {
		alignItems: 'flex-start',
		justifyContent: 'center',
		paddingLeft: metrics.marginHorizontalPercentage(2.5)
	},
	label: {
		fontFamily: fonts.type.lato.bold,
		fontSize: 16,
		color: colors.deepBlue
	},
	value: {
		fontFamily: fonts.type.lato.medium,
		fontSize: 14,
		color: colors.black
	}
});
