import React, {useEffect} from 'react';
import {NavigationContainer} from '@react-navigation/native';
import StackNav from './src/navigation';
import SplashScreen from 'react-native-splash-screen';

const App = () => {
  useEffect(() => {
    SplashScreen.hide();
  });

  return (
    <NavigationContainer>
      <StackNav />
    </NavigationContainer>
  );
};

export default App;
