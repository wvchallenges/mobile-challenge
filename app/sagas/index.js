import { takeLatest } from 'redux-saga';
import { put } from 'redux-saga/effects';
import { getProducts } from '../wave';

function* fetchProducts() {
  try {
    const products = yield getProducts();
    yield put({
      type: 'FETCH_PRODUCTS_SUCCEEDED',
      products,
    });
  } catch (error) {
    yield put({
      type: 'FETCH_PRODUCTS_FAILED',
      error,
    });
  }
}

function* watchFetchProducts() {
  yield* takeLatest('FETCH_PRODUCTS', fetchProducts);
}

export default watchFetchProducts;
