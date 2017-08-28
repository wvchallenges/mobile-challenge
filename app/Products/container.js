import { connect } from 'react-redux';
import { fetchProducts } from '../actions';
import ProductsComponent from './Products';

const mapStateToProps = state => ({
  products: state.products,
});

const mapDispatchToProps = dispatch => ({
  onMount: () => dispatch(fetchProducts()),
});

const Products = connect(
  mapStateToProps,
  mapDispatchToProps
)(ProductsComponent);

export default Products;
