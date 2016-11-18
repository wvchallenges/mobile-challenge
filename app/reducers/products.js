const products = (state = ['product1', 'product2', 'product3'], action) => {
  switch (action.type) {
    case 'FETCH_FROM_WAVE':
      return [...state];
    default:
      return state;
  }
};

export default products;
