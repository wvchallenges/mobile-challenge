import { NetInfo } from 'react-native';
import {
	GET_APP_DATA_START,
	GET_APP_DATA_SUCCESS,
	GET_APP_DATA_ERROR,
	GET_APP_DATA_PROGRESS,
	GET_APP_NETWORK_INFO
} from '../actionTypes';

import { getProducts } from './products';

const getAppDataStart = () => ({
	type: GET_APP_DATA_START
});
const getAppDataSuccess = () => ({
	type: GET_APP_DATA_SUCCESS
});

const getAppDataError = error => ({
	type: GET_APP_DATA_ERROR,
	error
});
const getAppDataProgress = progress => ({
	type: GET_APP_DATA_PROGRESS,
	progress
});

const getAppNetworkInfo = isConnected => ({
	type: GET_APP_NETWORK_INFO,
	isConnected
});

export const getAppData = () => async dispatch => {
	dispatch(getAppDataStart());

	try {
		const progress = [];

		await Promise.all([
			dispatch(getProducts()).then(() => {
				progress.push(true);
				dispatch(getAppDataProgress(progress.length / 4));
			})
		]);

		return dispatch(getAppDataSuccess());
	} catch (e) {
		const error = {
			message: e.message,
			stack: e.stack || {},
			err: JSON.stringify(e)
		};
		return dispatch(getAppDataError(error));
	}
};

export const getNetworkInfo = () => async dispatch => {
	NetInfo.isConnected.addEventListener('connectionChange', isConnected => {
		return dispatch(getAppNetworkInfo(isConnected));
	});

	// To offset a bug within react-native NetInfo.isConnected.addEventListener in a Simulator
	setInterval(async () => {
		const isConnected = await NetInfo.isConnected.fetch();
		return dispatch(getAppNetworkInfo(isConnected));
	}, 1000);
};
