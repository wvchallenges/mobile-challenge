import React from 'react';
import { Text } from 'react-native';

import strings from 'locales/loading';

import styles from './styles';

const Loading = (): JSX.Element => (
  <Text style={styles.text}>{strings.loading}</Text>
);

export default Loading;
