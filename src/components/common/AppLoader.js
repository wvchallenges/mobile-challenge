import React from 'react';
import {ActivityIndicator, Modal, StyleSheet, View} from 'react-native';
import {useSelector} from 'react-redux';

import colors from '../../configs/colors';

const ActivityIndicatorModal = ({children}) => {
  const loader = useSelector(state => state.loader);
  if (!loader?.loading) return <>{children}</>;

  return (
    <>
      {children}
      <Modal animationType="none" transparent visible={loader.loading}>
        <View style={styles.modalWrapper}>
          <View style={styles.modalContainer}>
            <ActivityIndicator
              animating
              color={colors.primaryColor}
              size="large"
            />
          </View>
        </View>
      </Modal>
    </>
  );
};

const styles = StyleSheet.create({
  modalWrapper: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(0, 0, 0, 0.52)',
  },
  modalContainer: {
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    borderRadius: 4,
    backgroundColor: '#fff',
  },
});

export default ActivityIndicatorModal;
