import { WorkerState } from 'state/util/create-worker';

export type ProductsState = WorkerState<Product[]>;

export interface Product {
  id: number;
  name: string;
  price: number;
}

const initialState: ProductsState = {
  data: [],
  error: undefined,
  loading: false,
};

export { initialState };
