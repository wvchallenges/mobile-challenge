import React from 'react';

import { NavigationContainer } from '@react-navigation/native';

import Menu from './menu';

const navigation = (): JSX.Element => (
  <NavigationContainer>
    <Menu />
  </NavigationContainer>
);

export default navigation;
