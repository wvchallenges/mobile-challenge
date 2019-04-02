import { StyleSheet } from 'react-native';
import colors from './colors';
import fonts from './fonts';

export default StyleSheet.create({
  safeAreaView: {
    backgroundColor: 'white',
  },
  h1: {
    fontFamily: fonts.type.lato.regular,
    fontSize: 18,
    color: colors.purplishGrey,
  },
  error: {
    fontFamily: fonts.type.lato.regular,
    fontSize: 16,
    color: colors.warmPink,
  },
});
