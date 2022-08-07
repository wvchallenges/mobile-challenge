import * as React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import StackNav from './src/navigation';

const App = () => {


  return (
    <NavigationContainer>
      <StackNav />
    </NavigationContainer>
  );
};

export default App;
