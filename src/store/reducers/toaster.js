import {createSlice} from '@reduxjs/toolkit';

const slice = createSlice({
  name: 'toaster',
  initialState: {
    isSuccess: false,
    toastMessage: '',
  },
  reducers: {
    successToast: (state, action) => {
      state.isSuccess = true;
      state.toastMessage = action.payload.message;
    },
    errorToast: (state, action) => {
      state.isSuccess = false;
      state.toastMessage = action.payload.message;
    },
  },
});

export const {successToast, errorToast} = slice.actions;

export default slice.reducer;
