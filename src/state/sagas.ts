import { all, fork } from 'redux-saga/effects';
import { SagaIterator } from 'redux-saga';

import productsSaga from 'state/products/saga';

const sagas = function* sagas(): SagaIterator<void> {
  yield all([fork(productsSaga)]);
};

export default sagas;
