const currencyFormatter = (locale, currency, price) => {
  const formatter = new Intl.NumberFormat(locale, {
    style: 'currency',
    currency: currency,
  });
  return formatter.format(price);
};

export const currencyDisplay = (format, price) => {
  let result;
  switch (format) {
    case 'en-CA':
      result = currencyFormatter('en-CA', 'CAD', price);
      console.log({result});
      break;
    case 'en-US':
      result = currencyFormatter('en-US', 'USD', price);
    default:
      break;
  }

  return result;
};
