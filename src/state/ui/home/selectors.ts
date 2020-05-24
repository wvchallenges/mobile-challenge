import { createStructuredSelector } from 'reselect';

import { Product } from 'state/products/state-definition';
import { State } from 'state/state-definition';

export interface HomeProduct extends Omit<Product, 'price'> {
  usPrice: string;
}

interface GetProductsSelector {
  error: Error | undefined;
  loading: boolean;
  products: HomeProduct[];
}

const getProductsData = (state: State): HomeProduct[] =>
  state.products.data.map(
    (product: Product): HomeProduct => ({
      id: product.id,
      name: product.name,
      usPrice: `$${product.price}`,
    }),
  );

const getLoading = (state: State): boolean => state.products.loading;
const getError = (state: State): Error | undefined => state.products.error;

const getProducts = createStructuredSelector<State, GetProductsSelector>({
  error: getError,
  loading: getLoading,
  products: getProductsData,
});

export default { getProducts };
