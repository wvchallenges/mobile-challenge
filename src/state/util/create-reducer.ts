const createReducer = <T>(
  initialState: T,
  actionHandlers: {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    [key: string]: (state: T, action: any) => T;
  },
) =>
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  (state = initialState, action: any): T => {
    const fn = actionHandlers[action.type];
    if (fn) {
      return fn(state, action);
    }

    return state;
  };

export default createReducer;
