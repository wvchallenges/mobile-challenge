import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';

import { AppLoader } from '../../containers';
import { AnimatedLogo } from '../../components';

import { animationType } from '../../services/animation';
import styles from './LandingPage.styles';

class LandingPage extends PureComponent {
	static propTypes = {
		navigation: PropTypes.object
	};

	render() {
		const { navigation } = this.props;

		return (
			<AnimatedLogo containerStyle={styles.container} contentAnimationType={animationType.TIMING}>
				<AppLoader navigation={navigation} />
			</AnimatedLogo>
		);
	}
}
export default LandingPage;
