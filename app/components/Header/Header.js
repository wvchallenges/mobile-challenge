import React from 'react';
import { View, Text, SafeAreaView } from 'react-native';

import styles from './Header.styles';
import { commonStyles } from '../../themes';

const Header = () => {
	return (
		<SafeAreaView style={commonStyles.safeAreaView}>
			<View style={styles.container}>
				<Text style={styles.text}>wave</Text>
			</View>
		</SafeAreaView>
	);
};

export default Header;
