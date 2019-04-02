import { StyleSheet } from 'react-native';
import { fonts, colors, metrics } from '../../themes';

export default StyleSheet.create({
	container: {
		display: 'flex',
		height: 75,
		flexDirection: 'row',
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: colors.white,
		marginHorizontal: metrics.marginHorizontal
	},
	icon: {
		height: 21,
		width: 23
	},
	textContainer: {
		flex: 1
	},
	text: {
		fontFamily: fonts.type.lato.bold,
		fontSize: 28,
		letterSpacing: 0,
		color: colors.deepBlue
	}
});
