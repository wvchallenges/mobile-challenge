const wave = (state = [], action) => {
  switch (action.type) {
    case 'FETCH_FROM_WAVE':
      return [
      ];
    default:
      return state;
  }
};

export default wave;
