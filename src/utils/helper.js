import NetInfo from '@react-native-community/netinfo';


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
      break;
    case 'en-US':
      result = currencyFormatter('en-US', 'USD', price);
    default:
      break;
  }

  return result;
};

export const checkInternetConnection = () => {
  return new Promise(resolve => {
    NetInfo.fetch()
      .then(state => {
        resolve(
          state.isConnected &&
            (Platform.OS === 'android' ? state.isInternetReachable : true),
        );
      })
      .catch(e => {
        console.log(e);
        resolve(false);
      });
  });
};
