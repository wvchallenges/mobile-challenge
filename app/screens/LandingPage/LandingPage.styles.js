import { StyleSheet } from 'react-native';
import { metrics } from '../../themes';

export default StyleSheet.create({
  container: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  button: {
    marginVertical: metrics.marginVerticalPercentage(3),
    paddingHorizontal: metrics.marginHorizontalPercentage(2),
    width: 234,
  },
  link: {
    alignSelf: 'center',
    marginVertical: metrics.marginVerticalPercentage(3),
  },
  signInContainer: {
    marginTop: metrics.marginVerticalPercentage(7),
  },
});
