import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import { View } from 'react-native';
import { Bar as ProgressBar } from 'react-native-progress';

import styles from './AppLoader.styles';
import { colors } from '../../themes';

class AppLoader extends PureComponent {
	static propTypes = {
		getAppData: PropTypes.func,
		progress: PropTypes.number,
		isLoading: PropTypes.bool,
		navigation: PropTypes.object
	};

	componentDidMount() {
		const { getAppData } = this.props;

		setTimeout(() => {
			getAppData();
		}, 150);
	}

	componentDidUpdate() {
		const { progress, isLoading, navigation } = this.props;

		if (progress === 1 && !isLoading) {
			setTimeout(() => {
				navigation.navigate('App');
			}, 350);
		}
	}

	render() {
		const { progress } = this.props;

		return (
			<View style={styles.container}>
				<ProgressBar
					color={colors.deepBlue}
					progress={progress}
					useNativeDriver={true}
					width={200}
				/>
			</View>
		);
	}
}
export default AppLoader;
