import {COLORS} from '../../components/colors';
import {StyleSheet, Platform} from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  header: {
    fontSize: 14,
    // fontFamily: 'OpenSans-Bold',
    fontWeight: Platform.OS === 'android' ? 'bold' : null,
    color: COLORS.headerText,
  },
  detail: {
    fontSize: 16,
    // fontFamily: 'OpenSans-Bold',
    fontWeight: Platform.OS === 'android' ? 'bold' : null,
    color: COLORS.detailGrey,
  },
  itemView: {
    flexDirection: 'row',
    borderBottomWidth: 1,
    paddingRight: 22,
    borderColor: COLORS.borderColor,
    padding: 12,
    flex: 1,
  },
  subDetail: {
    fontSize: 14,
    color: COLORS.greyText,
    paddingTop: 5,
    // fontFamily: 'OpenSans-SemiBold',
    fontWeight: Platform.OS === 'android' ? '600' : null,
  },
  time: {
    fontSize: 14,
    color: COLORS.red,
    paddingTop: 5,
    // fontFamily: 'OpenSans-SemiBold',
    fontWeight: Platform.OS === 'android' ? 'bold' : null,
  },
  subHeadingPage: {
    marginVertical: 40,
    marginLeft: 20,
    alignSelf: 'flex-start',
    fontSize: 30,
    alignItems: 'center',
    flexDirection: 'row',
  },
  contentContainer: {
    backgroundColor: '#ffffff',
    paddingBottom: 25,
    flexGrow: 1,
  },
  dutyText: {
    fontSize: 28,
    // fontFamily: 'OpenSans-Bold',
    color: COLORS.headerText,
    marginLeft: 12,
  },
  headText: {
    // fontFamily: 'OpenSans-SemiBold',
    fontSize: 14,
    color: COLORS.headerText,
    textTransform: 'uppercase',
    color: COLORS.greyText,
  },
  detailText: {
    // fontFamily: 'OpenSans-SemiBold',
    fontSize: 16,
    color: COLORS.headerText,
  },
  view1: {
    flex: 1,
    backgroundColor: '#fff',
    paddingHorizontal: 24,
    paddingVertical: 10,
    borderBottomWidth: 1,
    borderColor: COLORS.borderColor,
    borderTopWidth: 1,
    flexDirection: 'row',
  },
  listView: {
    paddingHorizontal: 12,
    paddingVertical: 20,
    borderBottomWidth: 1,
    borderColor: COLORS.borderColor,
    flexDirection: 'row',
    alignItems: 'center',
    width: '95%',
    marginHorizontal:10,
    justifyContent:'space-between'
  },
  view3: {
    flexDirection: 'row',
    paddingHorizontal: 0,
    borderBottomWidth: 1,
    borderColor: COLORS.borderColor,
  },
  view4: {
    paddingHorizontal: 24,
    paddingVertical: 10,
    borderBottomWidth: 1,
    borderColor: COLORS.borderColor,
  },
});

export default styles;
