import { StyleSheet } from 'react-native';
import { colors, metrics } from '../../themes';

export default StyleSheet.create({
	card: {
		alignSelf: 'center',
		width: '100%',
		height: 80,
		borderRadius: metrics.borderRadius,
		backgroundColor: colors.white,
		elevation: 8,
		shadowColor: colors.shadow,
		shadowOffset: {
			width: 0,
			height: 2
		},
		shadowRadius: 10,
		shadowOpacity: 1,
		marginVertical: metrics.marginVerticalPercentage(3)
	}
});
