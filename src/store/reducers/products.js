import {createSlice} from '@reduxjs/toolkit';
import moment from 'moment';

import serviceConst from '../../configs/serviceConst';
import {apiCallBegan} from '../actions/api';
import commons from '../../configs/commons';

const slice = createSlice({
  name: 'products',
  initialState: {
    lastFetch: null,
    list: [],
  },
  reducers: {
    productsFetched: (state, action) => {
      state.lastFetch = Date.now();
      state.list = [...action.payload.data];
    },
  },
});

export const {productsFetched} = slice.actions;
export default slice.reducer;

export const loadProducts = () => (dispatch, getState) => {
  const {lastFetch} = getState().products;
  console.log(lastFetch);
  const diffInMin = moment().diff(moment(lastFetch), 'minutes');

  if (diffInMin && diffInMin < 10) return;
  dispatch(
    apiCallBegan({
      url: `/${commons.SERVICE_ID}${serviceConst.FETCH_PRODUCTS}`,
      token: commons.AUTH_TOKEN,
      onSucess: productsFetched.type,
    }),
  );
};
