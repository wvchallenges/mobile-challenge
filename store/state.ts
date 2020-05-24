import Product from '../models/product';
export default interface HomeState {
  isLoading: boolean,
  products: Product[],
  error: string
};
