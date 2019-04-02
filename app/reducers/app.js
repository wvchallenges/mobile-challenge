import {
	GET_APP_DATA_START,
	GET_APP_DATA_SUCCESS,
	GET_APP_DATA_ERROR,
	GET_APP_DATA_PROGRESS,
	GET_APP_NETWORK_INFO
} from '../actionTypes';

export const defaultState = {
	isLoading: false,
	error: null,
	progress: 0
};

const app = (state = defaultState, action) => {
	switch (action.type) {
		case GET_APP_DATA_START:
			return {
				...state,
				isLoading: true
			};
		case GET_APP_DATA_SUCCESS:
			return {
				...state,
				isLoading: false,
				progress: 1
			};
		case GET_APP_DATA_ERROR:
			return {
				...state,
				isLoading: false,
				error: action.error
			};
		case GET_APP_DATA_PROGRESS:
			return {
				...state,
				progress: action.progress
			};
		case GET_APP_NETWORK_INFO:
			return {
				...state,
				isConnected: action.isConnected
			};
		default:
			return state;
	}
};

export default app;
