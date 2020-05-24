import { StyleSheet } from 'react-native';

import { Colors, TypeScale } from 'styles';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: 10,
  },
  text: {
    ...TypeScale.font.regular22,
    color: Colors.Text.black13,
  },
});

export default styles;
