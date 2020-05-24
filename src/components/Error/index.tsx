import React from 'react';
import { Text } from 'react-native';

import strings from 'locales/error';

import styles from './styles';

const Error = (): JSX.Element => (
  <Text style={styles.text}>{strings.message}</Text>
);

export default Error;
