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
      .then(response => response.json())
      .then(async json => {
        return json;
      });
  } catch (error) {
    console.error(error);
  }
};
