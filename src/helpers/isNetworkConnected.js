/* eslint-disable prettier/prettier */
import { Platform } from 'react-native';
import NetInfo from '@react-native-community/netinfo';

export async function isNetworkConnected() {
  return NetInfo.fetch().then((status) => {
    return status.isConnected;
  });
}
