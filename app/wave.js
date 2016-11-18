import api from '../settings';

const BUSINESS_ID = api.business_id;
const ACCESS_TOKEN = api.access_token;
const API_ENDPOINT = `https://api.waveapps.com/businesses/${BUSINESS_ID}/products/`;

const init = {
  headers: {
    Authorization: `Bearer ${ACCESS_TOKEN}`,
  },
};

/* eslint-disable arrow-body-style */
export const getProducts = () => {
  return fetch(API_ENDPOINT, init)
  .then(response => {
    return response.json()
    .then(json => {
      // console.log(json);
      return json;
    });
  });
};
/* eslint-enable */
