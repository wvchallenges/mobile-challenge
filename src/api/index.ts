import axios from 'axios';

const axiosConfig = {
  baseURL: 'https://api.waveapps.com/',
  headers: {
    Accept: 'application/json',
    Authorization: 'Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm',
  },
};

const api = axios.create(axiosConfig);

export default api;
