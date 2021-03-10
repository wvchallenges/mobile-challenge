import Api from '../helpers/service';

export async function getProducts() {
  try {
    const response = await Api.get('/products/');
    return response?.data;
  } catch (err) {
    return 'error';
  }
}
