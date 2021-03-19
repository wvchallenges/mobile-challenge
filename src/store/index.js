import {configureStore, getDefaultMiddleware} from '@reduxjs/toolkit';

import api from './middleware/api';
import rootReducer from './reducers/rootReducer';

const store = configureStore({
  reducer: rootReducer,
  middleware: [...getDefaultMiddleware(), api],
});

export default store;
