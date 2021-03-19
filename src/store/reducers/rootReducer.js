import {combineReducers} from '@reduxjs/toolkit';
import productReducer from './products';
import loaderReducer from './loader';
import toastReducer from './toaster';

const rootReducer = combineReducers({
  toaster: toastReducer,
  loader: loaderReducer,
  products: productReducer,
});

export default rootReducer;
