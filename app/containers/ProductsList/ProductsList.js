import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Text, FlatList, RefreshControl } from 'react-native';
import { ItemCard } from '../../components';
import ProductItem from './components/ProductItem';
import styles from './ProductsList.styles';

class ProductsList extends Component {
	static propTypes = {
		products: PropTypes.array
	};

	state = {
		refreshing: false
	};

	renderSectionHeader = () => <Text style={styles.subTitle}>Products</Text>;

	renderProducts = ({ item, index }) => <ProductItem index={index} product={item} />;

	renderEmptyComponent = () => (
		<ItemCard style={styles.itemCard}>
			<Text style={styles.h1}>{section.emptyString}</Text>
		</ItemCard>
	);

	handleRefresh = () => {
		const { getProducts } = this.props;
		this.setState({ refreshing: true });

		getProducts().then(() => {
			// To simulate a long wait time
			setInterval(() => {
				this.setState({ refreshing: false });
			}, 1000);
		});
	};

	render() {
		const { products } = this.props;
		const { refreshing } = this.state;

		return (
			<FlatList
				style={styles.sectionContainer}
				contentContainerStyle={styles.container}
				data={products}
				refreshControl={<RefreshControl refreshing={refreshing} onRefresh={this.handleRefresh} />}
				renderItem={this.renderProducts}
				ListHeaderComponent={this.renderSectionHeader}
				ListEmptyComponent={this.renderEmptyComponent}
				keyExtractor={(item, index) => item + index}
			/>
		);
	}
}

export default ProductsList;
