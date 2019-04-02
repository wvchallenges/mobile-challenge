import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import { Animated, Text, InteractionManager } from 'react-native';
import {
	animateIn,
	animationType,
	interpolateAnimation,
	animateOut
} from '../../services/animation';
import styles from './NetworkBar.styles';
import { colors } from '../../themes';

class NetworkBar extends PureComponent {
	static propTypes = {
		getNetworkInfo: PropTypes.func,
		isConnected: PropTypes.bool
	};

	animatedValue = new Animated.Value(0);
	animatedColor = new Animated.Value(1);

	componentDidMount() {
		const { getNetworkInfo } = this.props;

		getNetworkInfo();
	}

	componentDidUpdate() {
		const { isConnected } = this.props;
		const animOpts = [
			this.animatedValue,
			{ type: animationType.TIMING, duration: 250, delay: 250 }
		];

		if (!isConnected) {
			InteractionManager.runAfterInteractions(() => {
				animateIn(this.animatedColor, {
					type: animationType.SPRING,
					duration: 250,
					callback: animateIn(...animOpts)
				});
			});
		} else {
			InteractionManager.runAfterInteractions(() => {
				animateOut(this.animatedColor, { type: animationType.SPRING, duration: 250 });
				setTimeout(() => {
					animateOut(...animOpts);
				}, 1000);
			});
		}
	}

	render() {
		const { isConnected } = this.props;

		return (
			<Animated.View
				style={[
					{
						height: interpolateAnimation(this.animatedValue, [0, 80]),
						backgroundColor: interpolateAnimation(this.animatedColor, [colors.green, colors.red])
					},
					styles.container
				]}
			>
				<Text style={styles.text}>{isConnected ? 'Connected' : 'No Internet Connection'}</Text>
			</Animated.View>
		);
	}
}
export default NetworkBar;
