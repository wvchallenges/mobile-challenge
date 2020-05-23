import React from 'react';
import { SafeAreaView, Text } from 'react-native';

import strings from 'locales/home';

import styles from './styles';

const Home = (): JSX.Element => {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.screenHeader}>{strings.screenHeader}</Text>
    </SafeAreaView>
  );
};

export default Home;
