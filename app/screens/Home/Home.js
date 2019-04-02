import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { View } from 'react-native';

import { ProductsList } from '../../containers';

import styles from './Home.styles.js';

class Home extends Component {
	static propTypes = {
		error: PropTypes.object,
		getProducts: PropTypes.func,
		isLoading: PropTypes.bool,
		products: PropTypes.array
	};

	render() {
		const { products, getProducts } = this.props;

		return (
			<View style={styles.outterContainer}>
				<ProductsList products={products} getProducts={getProducts} />
			</View>
		);
	}
}

export default Home;
