import { combineReducers } from 'redux';

import products from 'state/products/reducer';

const reducers = combineReducers({ products });

export default reducers;
