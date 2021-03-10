const API_URL = 'https://api.waveapps.com/businesses/';
const business_id = '89746d57-c25f-4cec-9c63-34d7780b044b';

export default {
  api_url: API_URL,
  business_id: business_id,
  headers: {
    'Content-Type': 'application/json',
    Accept: 'application/json',
  },
  tokenType: 'Bearer',
};
