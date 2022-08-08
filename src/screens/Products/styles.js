import {COLORS} from '../../components/colors';
import {StyleSheet, Platform} from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    justifyContent:'center'
  },
  header: {
    fontSize: 14,
    fontWeight: Platform.OS === 'android' ? 'bold' : null,
    color: COLORS.headerText,
  },
  listView: {
    paddingHorizontal: 12,
    paddingVertical: 20,
    borderBottomWidth: 1,
    borderColor: COLORS.borderColor,
    flexDirection: 'row',
    alignItems: 'center',
    width: '95%',
    marginHorizontal: 10,
    justifyContent: 'center',
  },
  listItemText: {
    textAlign: 'left',
    color: COLORS.headerText,
    fontWeight: 'bold',
  },
  netView: {
    flex: 1,
    alignItems: 'center',
  },
});

export default styles;
