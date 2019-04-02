import { GET_PRODUCTS_START, GET_PRODUCTS_SUCCESS, GET_APP_DATA_ERROR } from '../actionTypes';

export const defaultState = {
	data: {},
	error: null,
	isLoading: false
};

const products = (state = defaultState, action) => {
	switch (action.type) {
		case GET_PRODUCTS_START:
			return {
				...state,
				isLoading: true
			};
		case GET_PRODUCTS_SUCCESS:
			return {
				...state,
				isLoading: false,
				data: action.data
			};
		case GET_APP_DATA_ERROR:
			return {
				...state,
				error: action.error,
				isLoading: false
			};
		default:
			return state;
	}
};

export default products;
