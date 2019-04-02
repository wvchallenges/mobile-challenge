import { combineReducers } from 'redux';
import { app, products } from '../reducers';

const entities = combineReducers({
	products
});

const createReducer = combineReducers({
	app,
	entities
});

export default createReducer;
