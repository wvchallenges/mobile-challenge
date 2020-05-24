import { call } from 'redux-saga/effects';
import { SagaIterator } from 'redux-saga';

import ProductsAPI from 'api/products';
import createWorker from 'state/util/create-worker';

import { Product } from './state-definition';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const mapProduct = (product: any): Product => ({
  id: product.id,
  name: product.name,
  price: product.price,
});

const worker = function* worker(): SagaIterator<Product> {
  const response = yield call(ProductsAPI.getProducts);
  return response.data.map(mapProduct);
};

export const { Actions, ReduceHandlers, saga } = createWorker(
  'products',
  worker,
);
