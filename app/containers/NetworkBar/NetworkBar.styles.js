import { StyleSheet } from 'react-native';
import { colors, fonts, metrics } from '../../themes';

export default StyleSheet.create({
	container: {
		alignItems: 'center',
		justifyContent: 'flex-end'
	},
	text: {
		textAlign: 'center',
		color: colors.white,
		fontFamily: fonts.type.lato.regular,
		fontSize: 13,
		marginBottom: metrics.marginVerticalPercentage(2.5)
	}
});
