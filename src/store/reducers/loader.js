import {createSlice} from '@reduxjs/toolkit';

const slice = createSlice({
  name: 'loader',
  initialState: {
    loading: false,
  },
  reducers: {
    startLoader: (state, action) => {
      console.log('in sucess loading');
      state.loading = true;
    },
    stopLoader: (state, action) => {
      console.log('in success fail');
      state.loading = false;
    },
  },
});

export const {startLoader, stopLoader} = slice.actions;

export default slice.reducer;
