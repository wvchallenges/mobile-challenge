import React from 'react';
import { Provider } from 'react-redux';

import Navigator from './src/navigation';
import store from './src/state/store';

const App = (): JSX.Element => (
  <Provider store={store}>
    <Navigator />
  </Provider>
);

export default App;
