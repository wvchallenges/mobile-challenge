export const Types = {
  GET_PRODUCTS: 'GET_PRODUCTS',
};

interface GetProductsAction {
  type: typeof Types.GET_PRODUCTS;
}

const Actions = {
  getProducts: (): GetProductsAction => ({
    type: Types.GET_PRODUCTS,
  }),
};

export default Actions;
