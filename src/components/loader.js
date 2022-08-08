import React from 'react';
import {ActivityIndicator, View, StyleSheet} from 'react-native';
import {COLORS} from './colors';

const renderLoader = () => {
  return (
    <View style={styles.background}>
      <ActivityIndicator animating={true} size="small" color={COLORS.blue} />
    </View>
  );
};

const styles = StyleSheet.create({
  background: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    justifyContent: 'center',
    alignItems: 'center',
    opacity: 1,
    zIndex: 10,
  },
});

export {renderLoader};
