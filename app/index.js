import React from 'react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import reducers from './reducers/';
import Products from './Products';

let store = createStore(reducers);

const App = () => (
  <Provider store={store}>
    <Products />
  </Provider>

);

export default App;
