import { StyleSheet } from 'react-native';
import { colors, metrics, fonts, commonStyles } from '../../themes';

export default StyleSheet.create({
	container: {
		flexDirection: 'column',
		justifyContent: 'flex-start',
		paddingHorizontal: metrics.marginHorizontalPercentage(3)
	},
	sectionContainer: {
		flex: 1,
		backgroundColor: colors.white,
		marginTop: metrics.marginVerticalPercentage(1)
	},
	subTitle: {
		fontFamily: fonts.type.lato.regular,
		fontSize: 22,
		color: colors.black,
		marginVertical: metrics.marginVerticalPercentage(3)
	},
	itemCard: {
		alignItems: 'center',
		justifyContent: 'center',
		marginVertical: metrics.marginVerticalPercentage(2.5)
	},
	h1: commonStyles.h1,
	addTaskButton: {
		alignSelf: 'center',
		marginVertical: metrics.marginVerticalPercentage(6)
	}
});
