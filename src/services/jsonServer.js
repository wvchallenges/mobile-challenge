import axios from 'axios';
//http://139.59.41.85/mydiskfiles/public/api/v1
const jsonServer = axios.create({
    baseURL:'https://lsapi.arabian-homes.com/api/ls'
});

export default jsonServer; 