/* eslint-disable prettier/prettier */
import NetInfo from '@react-native-community/netinfo';

export async function isNetworkConnected() {
  return await NetInfo.fetch().then((status) => {
    return status.isConnected;
  });
}
