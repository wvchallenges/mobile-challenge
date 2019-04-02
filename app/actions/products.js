import { normalize } from 'normalizr';
import api from '../api';
import { GET_PRODUCTS_START, GET_PRODUCTS_SUCCESS, GET_PRODUCTS_ERROR } from '../actionTypes';

import { productsSchema } from '../schema';

const getProductsStart = () => ({
	type: GET_PRODUCTS_START
});
const getProductsSuccess = data => ({
	type: GET_PRODUCTS_SUCCESS,
	data
});
const getProductsError = error => ({
	type: GET_PRODUCTS_ERROR,
	error
});

export const getProducts = () => async dispatch => {
	dispatch(getProductsStart());

	try {
		const response = await api().get('/products/');

		const {
			entities: { products }
		} = normalize(response.data, [productsSchema]);

		return dispatch(getProductsSuccess(products || {}));
	} catch (e) {
		const error = {
			message: e.message,
			stack: e.stack || {},
			err: JSON.stringify(e)
		};
		return dispatch(getProductsError(error));
	}
};
