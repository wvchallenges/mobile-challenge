import React, {useEffect, useState} from 'react';
import * as Animatable from 'react-native-animatable';
import {View, StyleSheet, Modal, StatusBar, Platform, Text} from 'react-native';
import NetInfo from '@react-native-community/netinfo';

import colors from '../../configs/colors';

export default function AppNoInternet({children}) {
  const [modalVisible, setModalVisible] = useState(false);
  const [animationType, setAnimationType] = useState('fadeInDownBig');
  const [isConnected, setIsConnected] = useState(true);

  useEffect(() => {
    checkConnectivity();
  }, []);

  const checkConnectivity = () => {
    NetInfo.addEventListener(state => {
      setIsConnected(state.isConnected);
    });
  };

  useEffect(() => {
    if (isConnected) {
      setAnimationType('fadeOutUpBig');
      // hide the modal after 2 seconds so that the banner's animation is rendered
      setTimeout(() => {
        setModalVisible(false);
      }, 500);
    } else {
      setModalVisible(true);
      setAnimationType('fadeInDownBig');
    }
  }, [isConnected]);

  if (!animationType) return null;

  return (
    <>
      <StatusBar backgroundColor={modalVisible ? 'red' : 'grey'} />
      <Modal transparent={true} visible={modalVisible}>
        <View style={styles.container}>
          <Animatable.View
            animation={animationType}
            style={styles.animatableView}>
            <Text style={styles.internetTxt}>
              You are not connected to the Internet
            </Text>
          </Animatable.View>
        </View>
      </Modal>
      {children}
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'rgba(0, 0, 0, 0.4)',
    zIndex: 999,
  },
  animatableView: {
    alignItems: 'center',
    justifyContent: 'flex-end',
    height: Platform.OS === 'ios' ? 80 : 50,
    backgroundColor: 'red',
    paddingBottom: 20,
  },
  internetTxt: {
    color: colors.white,
    fontSize: 16,
  },
});
