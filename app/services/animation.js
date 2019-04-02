import { Animated, LayoutAnimation } from 'react-native';

export const animationType = {
	SPRING: 'spring',
	TIMING: 'timing'
};

export const interpolateAnimation = (animatedValue, outputRange, inputRange = [0, 1], options) =>
	animatedValue.interpolate({
		inputRange,
		outputRange,
		...options
	});

export const animateIn = (
	animatedValue,
	{ duration = 200, callback = () => {}, type = animationType.SPRING, delay = 0 } = {}
) => {
	Animated.sequence([
		Animated.delay(delay),
		Animated[type](animatedValue, { toValue: 1, duration })
	]).start(callback);
};
export const animateOut = (
	animatedValue,
	{ duration = 200, callback = () => {}, type = animationType.TIMING, delay = 0 } = {}
) => {
	Animated.sequence([
		Animated.delay(delay),
		Animated[type](animatedValue, { toValue: 0, duration })
	]).start(callback);
};

export const customLayoutAnimation = {
	spring: {
		opacity: (duration = 300) => ({
			duration,
			create: {
				type: LayoutAnimation.Types.spring,
				property: LayoutAnimation.Properties.opacity,
				springDamping: 0.7
			},
			update: {
				type: LayoutAnimation.Types.spring,
				property: LayoutAnimation.Properties.opacity,
				springDamping: 0.7
			},
			delete: {
				type: LayoutAnimation.Types.spring,
				property: LayoutAnimation.Properties.opacity,
				springDamping: 0.7
			}
		}),
		scale: {
			withCreate: {
				create: {
					duration: 350,
					type: LayoutAnimation.Types.spring,
					property: LayoutAnimation.Properties.scaleXY,
					springDamping: 0.7
				},
				update: {
					duration: 350,
					type: LayoutAnimation.Types.spring,
					property: LayoutAnimation.Properties.scaleXY,
					springDamping: 0.7
				}
			},
			withDelete: {
				delete: {
					duration: 350,
					type: LayoutAnimation.Types.spring,
					property: LayoutAnimation.Properties.scaleXY,
					springDamping: 0.7
				},
				update: {
					duration: 350,
					type: LayoutAnimation.Types.spring,
					property: LayoutAnimation.Properties.scaleXY,
					springDamping: 0.7
				}
			}
		}
	},
	easeInEaseOut: (duration = 250) => ({
		duration,
		create: {
			type: LayoutAnimation.Types.easeInEaseOut,
			property: LayoutAnimation.Properties.opacity
		},
		update: {
			type: LayoutAnimation.Types.easeInEaseOut,
			property: LayoutAnimation.Properties.opacity
		}
	})
};
