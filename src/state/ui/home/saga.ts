import { put, takeLatest } from 'redux-saga/effects';
import { SagaIterator } from 'redux-saga';

import Actions from 'state/products/actions';

import { Types } from './actions';

const getProductsSaga = function* getProductsSaga(): SagaIterator<void> {
  yield put(Actions.request({}));
};

const saga = function* saga(): SagaIterator<void> {
  yield takeLatest(Types.GET_PRODUCTS, getProductsSaga);
};

export default saga;
