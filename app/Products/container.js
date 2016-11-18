import { connect } from 'react-redux';
import { fetchFromWave } from '../actions';
import ProductsComponent from './Products';

const mapStateToProps = state => (
  {
    products: state.products,
  }
);

const mapDispatchToProps = dispatch => (
  {
    onMount: () => {
      dispatch(fetchFromWave());
    },
  }
);

const Products = connect(
  mapStateToProps,
  mapDispatchToProps
)(ProductsComponent);

export default Products;
