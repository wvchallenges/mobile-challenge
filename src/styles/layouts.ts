import { StyleSheet } from 'react-native';

import Colors from './colors';
import TypeScale from './type-scale';

const Constants = {
  globalHMargin: 20,
  globalTopMargin: 20,
};

const Layouts = StyleSheet.create({
  globalHMargin: {
    paddingHorizontal: Constants.globalHMargin,
  },
  globalTopMargin: {
    paddingTop: Constants.globalTopMargin,
  },
  screenHeader: {
    ...TypeScale.font.regular28,
    color: Colors.Text.black13,
    paddingHorizontal: Constants.globalHMargin,
    paddingTop: Constants.globalTopMargin,
  },
});

export default Layouts;
