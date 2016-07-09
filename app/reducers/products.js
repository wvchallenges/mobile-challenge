import {
  REQUEST_PRODUCTS,
  RECEIVE_PRODUCTS,
  CATCH_PRODUCTS_ERROR
} from '../actions/products'

export function products(state = {
  isFetching: false,
  lastUpdated: null,
  error: null,
  data: []
}, action) {
  switch (action.type) {
    case REQUEST_PRODUCTS:
      return {
        ...state,
        isFetching: true,
        error: null
      }
    case RECEIVE_PRODUCTS:
      return {
        ...state,
        isFetching: false,
        data: action.products,
        lastUpdated: action.receivedAt
      }
    case CATCH_PRODUCTS_ERROR:
      return {
        ...state,
        error: action.error,
        isFetching: false
      }
    default:
      return state
  }
}
