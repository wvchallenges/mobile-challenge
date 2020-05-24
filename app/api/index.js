import axios from 'axios';
// import Config from 'react-native-config'; // ideally, the api url will be pulled from th e.env file
import { API_URL } from '../constants'
export const axiosInstance = axios.create({
    baseURL: API_URL,
})