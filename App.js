/**
 *
 * @author VIBIN E JOBY
 */

import React from 'react';
import {Provider} from 'react-redux';
import {NavigationContainer} from '@react-navigation/native';

import store from './src/store/index';
import RootStackNav from './src/navigations/RootStackNav';
import AppToasts from './src/components/common/AppToasts';
import AppLoader from './src/components/common/AppLoader';
import AppNoInternet from './src/components/common/AppNoInternet';

const App = () => {
  return (
    <Provider store={store}>
      <AppNoInternet>
        <AppLoader>
          <AppToasts>
            <NavigationContainer>
              <RootStackNav />
            </NavigationContainer>
          </AppToasts>
        </AppLoader>
      </AppNoInternet>
    </Provider>
  );
};

export default App;
