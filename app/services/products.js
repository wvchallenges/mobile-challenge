import { formatPrice } from '../utils/formatter';

export const formatProducts = products => {
	const formattedProducts = [];

	if (!products) return formattedProducts;

	const arrayOfProductsIds = Object.keys(products);

	arrayOfProductsIds.forEach(productId => {
		const { id, name, price } = products[productId];

		formattedProducts.push({
			id,
			name,
			price: formatPrice(price)
		});
	});

	console.log(typeof formattedProducts);

	return formattedProducts;
};
