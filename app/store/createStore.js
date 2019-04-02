import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import { composeWithDevTools } from 'remote-redux-devtools';
import Config from '../config/debug';
import reducers from './reducers';

export default () => {
	const middleware = [thunk];
	const composeEnhancers = composeWithDevTools({
		port: 5678
	});

	const enhancers = composeEnhancers(applyMiddleware(...middleware));

	/* eslint-disable no-console*/
	const createAppropriateStore = Config.useReactotron ? console.tron.createStore : createStore;

	const store = createAppropriateStore(reducers, enhancers);

	return {
		store
	};
};
