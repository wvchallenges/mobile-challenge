import createReducer from '../create-reducer';

interface State {
  control: string;
  data: number[];
}

const initialState = {
  control: 'control',
  data: [],
};

const testReducer = (state: State): State => ({
  ...state,
  data: [1],
});

const ReduceHandlers = {
  TEST_REDUCER: testReducer,
};

test('create-reducer', (): void => {
  const reducer = createReducer(initialState, ReduceHandlers);
  expect(reducer(initialState, { type: 'TEST_REDUCER' })).toEqual({
    control: 'control',
    data: [1],
  });
});
