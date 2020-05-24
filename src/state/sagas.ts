import { all, fork } from 'redux-saga/effects';
import { SagaIterator } from 'redux-saga';

import productsSaga from 'state/products/saga';
import homeSaga from 'state/ui/home/saga';

const sagas = function* sagas(): SagaIterator<void> {
  yield all([fork(productsSaga), fork(homeSaga)]);
};

export default sagas;
