const currencyFormatter = (locale, currency, price) => {
  const formatter = new Intl.NumberFormat(locale, {
    style: 'currency',
    currency: currency,

    // These options are needed to round to whole numbers if that's what you want.
    //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
    //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
  });
  console.log('price', formatter.format(price));
  return formatter.format(price);
};

export const currencyDisplay = (format, price) => {
    console.log('in currency ', format, price);
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
