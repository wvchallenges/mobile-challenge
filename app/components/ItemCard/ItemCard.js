import React from 'react';
import { View } from 'react-native';
import PropTypes from 'prop-types';

import styles from './ItemCard.styles';

const ItemCard = ({ children, style }) => <View style={[styles.card, style]}>{children}</View>;

ItemCard.propTypes = {
	children: PropTypes.node,
	style: PropTypes.oneOfType([PropTypes.object, PropTypes.array])
};

export default ItemCard;
