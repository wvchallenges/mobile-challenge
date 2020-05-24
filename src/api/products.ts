import api from 'api';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const getProducts = (): any => {
  const products = api.get(
    '/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/',
  );
  return products;
};

export default { getProducts };
