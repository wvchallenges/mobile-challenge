import { StyleSheet } from 'react-native';

import { Layouts } from 'styles';

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  dataContainer: {
    ...Layouts.globalHMargin,
    flex: 1,
    marginTop: 50,
  },
  errorContainer: {
    alignItems: 'center',
    flex: 1,
    justifyContent: 'center',
  },
  loadingContainer: {
    alignItems: 'center',
    flex: 1,
    justifyContent: 'center',
  },
  screenHeader: {
    ...Layouts.globalHMargin,
    ...Layouts.globalTopMargin,
    ...Layouts.screenHeader,
  },
});

export default styles;
