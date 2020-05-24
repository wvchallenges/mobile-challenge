import createReducer from '../lib/createReducer';
import * as types from '../actions/types';
import HomeState from '../store/state';

export const fetchProducts = createReducer({}, {
  [types.SET_PRODUCTS](state: HomeState, action: any) {
    let newState = {... state,"products": action.products,"isLoading": action.flag, error: "" };
    return newState;
  },
  [types.SET_LOADING](state: HomeState, action: any) {
    let newState = {... state, "isLoading": action.flag, "error": action.error };
    return newState;
  },
  [types.SET_ERROR](state: HomeState, action: any) {
    let newState = {... state, "error": action.error };
    return newState;
  }
});