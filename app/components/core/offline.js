import React from 'react';
import { View, StyleSheet, FlatList, SafeAreaView, TouchableOpacity, ScrollView, RefreshControl, Text, Button } from 'react-native';
import DeviceSettings from 'react-native-device-settings';

const Offline = () => {
	return (
		<View>
			<Text>{'Wifi or Cellular Data is Turned Off for "Wave HQ"'}</Text>
			<Text>{'You can turn on wifi or cellular data for this app in settings'}</Text>
			<Button
				onPress={() => {
					DeviceSettings.wifi();
				}}
				title="Go to Settings"
				color="#841584"
				accessibilityLabel="Learn more about this purple button"
			/>
		</View>
	);
};

export default Offline;
