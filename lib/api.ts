import axios from 'axios';

const axiosInstance = axios.create({
  'baseURL': 'https://api.waveapps.com/'
});

export default axiosInstance;