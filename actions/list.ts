import * as types from './types';
import Api from '../lib/api';
import { API_TOKEN } from '../config/constants';
import { Dispatch } from 'redux';
import Product from '../models/product';
import HomeState from '../store/state';
export function setLoading(flag: boolean, error: string) {
  return {
    type: types.SET_LOADING,
    flag,
    error
  }
}

export function setError(error: string) {
  return {
    type: types.SET_ERROR,
    error
  }
}

export function fetchProducts(businessId: string) {
  const uri = `businesses/${businessId}/products/`;
  const config = {
    headers: { Authorization: `Bearer ${API_TOKEN}` }
  };

  return (dispatch: Dispatch, getState: HomeState) => {
    dispatch(setLoading(true,""));
    return Api.get(uri, config).then(response => {
      let data = response.data;
      dispatch(setFetchedProducts(data, false));
    }).catch((ex) => {
      let message = ex.message;
      dispatch(setLoading(false, message));
    });
  }
}


export function setFetchedProducts(products: Product[], flag: boolean) {
  return {
    type: types.SET_PRODUCTS,
    products,
    flag
  }
}