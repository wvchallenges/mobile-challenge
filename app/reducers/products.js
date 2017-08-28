const products = (state = [], action) => {
  switch (action.type) {
    case 'FETCH_PRODUCTS_SUCCEEDED':
      // console.log('FETCH_PRODUCTS_SUCCEEDED');
      return action.products;
    case 'FETCH_PRODUCTS_FAILED':
      // console.log('FETCH_PRODUCTS_FAILED');
      // console.log(action.error);
      return state;
    default:
      return state;
  }
};

export default products;
