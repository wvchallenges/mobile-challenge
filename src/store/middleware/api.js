import HttpService from '../../network/HttpService';
import {apiCallBegan} from '../actions/api';
import serviceConst from '../../configs/serviceConst';
import data from '../../configs/mockData.json';
import {startLoader, stopLoader} from '../reducers/loader';
import {errorToast} from '../reducers/toaster';

const api = ({dispatch}) => next => async action => {
  if (action.type !== apiCallBegan.type) {
    return next(action);
  }

  const {url, token, onSucess} = action.payload;
  try {
    dispatch({type: startLoader.type});
    const apiUrl = serviceConst.BASE_URL + url;
    HttpService.setHeader(`Bearer ${token}`);

    //To fetch mock data
    //const response = data.response;

    //to fetch from api
    const response = await HttpService.get(apiUrl);

    if (onSucess) dispatch({type: onSucess, payload: {data: response}});
  } catch (error) {
    console.log(error);
    dispatch({
      type: errorToast.type,
      payload: {message: error?.message},
    });
  }
  dispatch({type: stopLoader.type});
};

export default api;
