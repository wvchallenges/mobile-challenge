import axios from 'axios';

import { config } from '../../config';

const api = () => {
	const headers = {
		'X-Requested-With': 'XMLHttpRequest',
		authorization: `Bearer ${config.ACCESS_TOKEN}`
	};

	const instance = axios.create({
		baseURL: `${config.API_URL}/${config.BUSINESS_ID}`,
		headers
	});

	instance.interceptors.response.use(
		response => {
			return response;
		},
		error => {
			if (!error.response) {
				return;
			}

			console.tron.log(error);

			throw error.response;
		}
	);

	return instance;
};

export default api;
