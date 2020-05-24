/* eslint-disable @typescript-eslint/no-explicit-any */

import { call, put, takeLatest } from 'redux-saga/effects';
import { SagaIterator } from 'redux-saga';

export interface WorkerState<T> {
  data: T;
  error: Error | undefined;
  loading: boolean;
}

interface Action<P, T> {
  payload: P;
  type: T;
}

interface ErrorPayload {
  error: Error | undefined;
}

interface LoadingPayload {
  isLoading: boolean;
}

interface Actions {
  error: (payload: ErrorPayload) => Action<ErrorPayload, string>;
  loading: (payload: LoadingPayload) => Action<LoadingPayload, string>;
  request: (payload: any) => Action<any, string>;
  success: (payload: any) => Action<any, string>;
}

interface ReduceHandlers {
  [key: string]: any;
}

interface Worker {
  Actions: Actions;
  ReduceHandlers: ReduceHandlers;
  saga: () => SagaIterator<void>;
}

const createWorker = <T, P>(
  name: string,
  worker: (payload: P) => SagaIterator<T>,
): Worker => {
  const Types = {
    ERROR: `${name}/ERROR`,
    LOADING: `${name}/LOADING`,
    REQUEST: `${name}/REQUEST`,
    SUCCESS: `${name}/SUCCESS`,
  };

  const Actions = {
    error: (
      payload: ErrorPayload,
    ): Action<ErrorPayload, typeof Types.ERROR> => ({
      payload,
      type: Types.ERROR,
    }),
    loading: (
      payload: LoadingPayload,
    ): Action<LoadingPayload, typeof Types.LOADING> => ({
      payload,
      type: Types.LOADING,
    }),
    request: (payload: P): Action<P, typeof Types.REQUEST> => ({
      payload,
      type: Types.REQUEST,
    }),
    success: (payload: any): Action<any, typeof Types.SUCCESS> => ({
      payload,
      type: Types.SUCCESS,
    }),
  };

  const ReduceHandlers = {
    [Types.ERROR]: (
      state: WorkerState<T>,
      action: Action<ErrorPayload, typeof Types.ERROR>,
    ): WorkerState<T> => ({
      ...state,
      error: action.payload.error,
    }),
    [Types.LOADING]: (
      state: WorkerState<T>,
      action: Action<LoadingPayload, typeof Types.LOADING>,
    ): WorkerState<T> => ({
      ...state,
      loading: action.payload.isLoading,
    }),
    [Types.SUCCESS]: (
      state: WorkerState<T>,
      action: Action<any, typeof Types.SUCCESS>,
    ): WorkerState<T> => ({
      ...state,
      data: action.payload,
    }),
  };

  const requestSaga = function* requestSaga({
    payload,
  }: any): SagaIterator<void> {
    try {
      yield put(Actions.loading({ isLoading: true }));
      const response = yield call(worker, payload);
      yield put(Actions.loading({ isLoading: false }));
      yield put(Actions.success(response));
    } catch (error) {
      // eslint-disable-next-line no-console
      console.log(`error: ${error}`);
      yield put(Actions.error({ error }));
    }
  };

  const saga = function* saga(): SagaIterator<void> {
    yield takeLatest(Types.REQUEST, requestSaga);
  };

  return {
    Actions,
    ReduceHandlers,
    saga,
  };
};

export default createWorker;
