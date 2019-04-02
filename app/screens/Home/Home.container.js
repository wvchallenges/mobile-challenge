import { connect } from 'react-redux';
import Home from './Home';

import { formatProducts } from '../../services/products';
import { getProducts } from '../../actions';

const mapStateToProps = ({
	entities: {
		products: { isLoading, error, data }
	}
}) => ({
	products: formatProducts(data),
	isLoading,
	error
});

const mapDispatchToProps = {
	getProducts
};

export default connect(
	mapStateToProps,
	mapDispatchToProps
)(Home);
