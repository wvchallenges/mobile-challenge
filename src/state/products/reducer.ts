import createReducer from 'state/util/create-reducer';

import { ReduceHandlers } from './worker';

const initialState = {
  data: [],
  error: null,
  loading: false,
};

export default createReducer(initialState, ReduceHandlers);
