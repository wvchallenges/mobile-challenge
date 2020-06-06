import { SagaIterator } from 'redux-saga';
import { call } from 'redux-saga/effects';

import createWorker from '../create-worker';

const mockFunction = (): number[] => [1, 2, 3];

const worker = function* worker(): SagaIterator<number[]> {
  return yield call(mockFunction);
};

const error = { error: Error('error') };
const loading = { isLoading: true };

const state = {
  data: {},
  error: undefined,
  loading: false,
};

test('create-worker', (): void => {
  const { Actions, ReduceHandlers } = createWorker('test', worker);

  expect(Actions.error(error)).toEqual({
    payload: error,
    type: 'test/ERROR',
  });

  expect(Actions.loading(loading)).toEqual({
    payload: loading,
    type: 'test/LOADING',
  });

  expect(Actions.request({})).toEqual({
    payload: {},
    type: 'test/REQUEST',
  });

  expect(Actions.success({})).toEqual({
    payload: {},
    type: 'test/SUCCESS',
  });

  expect(
    ReduceHandlers['test/ERROR'](state, { payload: error, type: 'test/ERROR' }),
  ).toEqual({
    data: {},
    error: Error('error'),
    loading: false,
  });

  expect(
    ReduceHandlers['test/LOADING'](state, {
      payload: loading,
      type: 'test/LOADING',
    }),
  ).toEqual({
    data: {},
    error: undefined,
    loading: true,
  });

  expect(
    ReduceHandlers['test/SUCCESS'](state, {
      payload: { numbers: [1, 2, 3] },
      type: 'test/SUCCESS',
    }),
  ).toEqual({
    data: { numbers: [1, 2, 3] },
    error: undefined,
    loading: false,
  });
});
