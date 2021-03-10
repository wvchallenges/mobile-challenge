import { getProducts } from './products';

it('products api check', async () => {
  const products = await getProducts();

  // assertions /expects
  expect(products.length).toEqual(11);
  expect.assertions(1);
  try {
    await getProducts();
  } catch (e) {
    expect(e).toMatch('error');
  }
});
