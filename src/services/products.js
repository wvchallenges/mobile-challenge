import Api from '../helpers/service';

export async function getProducts() {
  try {
    const response = await Api.get('/products/');
    console.log({ response });
    return response.data;
  } catch (err) {
    console.log('Product Api Error', err);
    return false;
  }
}
