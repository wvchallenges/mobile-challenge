import React from 'react';
import PropTypes from 'prop-types';
import { Text } from 'react-native';
import { ItemCard } from '../../../components';

import styles from './ProductItem.styles';

const ProductItem = ({ product: { name, price }, style }) => (
	<ItemCard style={styles.container}>
		<Text style={styles.label}>
			Name: <Text style={styles.value}>{name}</Text>
		</Text>
		<Text style={styles.label}>
			Price: <Text style={styles.value}>{price}</Text>
		</Text>
	</ItemCard>
);

ProductItem.propTypes = {
	product: PropTypes.object,
	style: PropTypes.oneOfType([PropTypes.object, PropTypes.array])
};

export default ProductItem;
