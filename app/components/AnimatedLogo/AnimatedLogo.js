import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import { View, Animated, LayoutAnimation, InteractionManager } from 'react-native';

import logo from '../../assets/images/logo.png';
import styles from './AnimatedLogo.styles';
import { customLayoutAnimation, animateIn, animationType } from '../../services/animation';

const { SPRING, TIMING } = animationType;

class AnimatedLogo extends PureComponent {
	static propTypes = {
		children: PropTypes.any,
		containerStyle: PropTypes.object,
		contentAnimationType: PropTypes.oneOf([SPRING, TIMING]),
		onAnimationEnd: PropTypes.func
	};
	static defaultProps = {
		contentAnimationType: SPRING,
		onAnimationEnd: () => {}
	};

	animatedValue = new Animated.Value(0);

	state = {
		showChildren: false
	};

	componentDidMount() {
		setTimeout(() => {
			this.triggerAnimation();
		}, 200);
	}

	triggerAnimation = () => {
		const { contentAnimationType } = this.props;
		InteractionManager.runAfterInteractions(() => {
			LayoutAnimation.configureNext(customLayoutAnimation.easeInEaseOut(250));

			this.setState({ showChildren: true }, () => {
				InteractionManager.runAfterInteractions(() => {
					animateIn(this.animatedValue, {
						type: contentAnimationType,
						duration: 200,
						callback: this.animationEnd,
						delay: 150
					});
				});
			});
		});
	};

	animationEnd = () => {
		const { onAnimationEnd } = this.props;
		onAnimationEnd();
	};

	render() {
		const { children, containerStyle } = this.props;
		const { showChildren } = this.state;
		return (
			<View style={styles.container}>
				<Animated.Image source={logo} style={styles.logo} />
				{showChildren && (
					<Animated.View
						style={[
							containerStyle,
							{
								transform: [
									{
										scale: this.animatedValue
									}
								],
								opacity: this.animatedValue
							}
						]}
					>
						{children}
					</Animated.View>
				)}
			</View>
		);
	}
}
export default AnimatedLogo;
