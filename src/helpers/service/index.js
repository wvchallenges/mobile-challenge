import config from './config';
import { isNetworkConnected } from '../isNetworkConnected';
import Axios from 'axios';

const api_url = config.api_url;
const business_id = config.business_id;
function buildHeaders(options) {
  const authToken = '6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm';
  const headers = {
    ...config.headers,
    ...(options && options.headers && options.headers),
  };
  if (authToken) {
    headers.Authorization = `Bearer ${authToken}`;
  }

  return headers;
}

async function api(method, path, data, options) {
  const url = api_url + business_id + path;

  const headers = await buildHeaders(options);
  const axiosConfig = {
    method,
    url,
    headers,
    ...(method === 'GET'
      ? {
          params: data,
        }
      : {
          data,
        }),
  };
  return await isNetworkConnected().then((status) => {
    if (status) {
      return Axios(axiosConfig);
    } else {
      console.log('Network is not conneted');
    }
  });
}

export default {
  get: (path, params, options) => api('GET', path, params, options),
  post: (path, data, options) => api('POST', path, data, options),
  delete: (path, data, options) => api('DELETE', path, data, options),
  put: (path, data, options) => api('PUT', path, data, options),
};
