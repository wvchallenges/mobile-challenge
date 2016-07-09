import { access_token, business_id } from '../../environment.json'

export const REQUEST_PRODUCTS = 'REQUEST_PRODUCTS'
export const RECEIVE_PRODUCTS = 'RECEIVE_PRODUCTS'
export const CATCH_PRODUCTS_ERROR = 'CATCH_PRODUCTS_ERROR'

const ACCESS_TOKEN = access_token
const BUSINESS_ID = business_id

function requestProducts() {
  return {
    type: REQUEST_PRODUCTS
  }
}

function receiveProducts(products) {
  return {
    type: RECEIVE_PRODUCTS,
    products,
    receivedAt: Date.now()
  }
}

function catchProductsError(err) {
  return {
    type: CATCH_PRODUCTS_ERROR,
    error: err
  }
}

export function fetchProducts() {
  return (dispatch, getState) => {
    dispatch(requestProducts())

    fetch(`https://api.waveapps.com/businesses/${BUSINESS_ID}/products/`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${ACCESS_TOKEN}`
      },
      timeout: 20
    })
    .then(response => {
      const promise = response.json()
      if (response.ok) {
        return promise
      } else {
        return promise.then(json => { throw json.error })
      }
    })
    .then(json => dispatch(receiveProducts(json)))
    .catch(err => dispatch(catchProductsError(err)))
  }
}
