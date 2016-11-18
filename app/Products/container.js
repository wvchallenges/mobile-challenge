import { connect } from 'react-redux';
import { fetchFromWave } from '../actions';
import ProductsComponent from './index';

const mapStateToProps = state => (
  {
    product: fetchFromWave(state.products),
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
