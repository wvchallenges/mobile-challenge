import { StyleSheet } from 'react-native';

import { Layouts } from 'styles';

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  screenHeader: {
    ...Layouts.globalTopMargin,
    ...Layouts.globalHMargin,
    ...Layouts.screenHeader,
  },
});

export default styles;
