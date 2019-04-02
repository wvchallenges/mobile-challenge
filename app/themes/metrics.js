import { Dimensions } from 'react-native';
const { width, height } = Dimensions.get('window');

const metrics = {
	marginHorizontal: 20,
	marginVertical: 20,
	screenWidth: width < height ? width : height,
	screenHeight: width < height ? height : width,
	marginHorizontalPercentage: value => {
		return (value / 100) * height;
	},
	marginVerticalPercentage: value => {
		return (value / 100) * width;
	},
	borderRadius: 10
};

export default metrics;
