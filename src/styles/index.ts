import merge from 'lodash/merge';
import { StyleSheet } from 'react-native';

import Colors from './colors';
import TypeScale from './type-scale';
import Layouts from './layouts';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const styleSheetMerge = (baseStyle: any, ...diffStyles: any): any =>
  StyleSheet.create(merge({}, baseStyle, ...diffStyles));

export { Colors, TypeScale, Layouts, styleSheetMerge };
