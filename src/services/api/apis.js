import {accessToken, baseURL} from './constants';

export const getAPI = async endpoint => {
  const url = baseURL + endpoint;
  try {
    return await fetch(url, {
      method: 'get',
      headers: new Headers({
        Authorization: 'Bearer ' + accessToken,
      }),
    })
      .then(async response => {
        let data = await response.json();
        if (response.status === 200) {
          let obj = {};
          obj.status = true;
          obj.data = data;
          return obj;
        } else {
          let obj = {};
          obj.status = false;
          obj.data = data;
          return obj;
        }
      })
      .catch(error => {
        console.log('Error', error);
      });
  } catch (error) {
    console.error(error);
  }
};
