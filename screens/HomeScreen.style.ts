import {StyleSheet} from 'react-native';
export default StyleSheet.create({
  container: {
    flex: 1
  },
  activityIndicator: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    color: '#bc2b78',
    alignItems: 'center',
    justifyContent: 'center'
  },
  error: {
    color: 'red',
    fontSize: 20,
    textAlign:'center'
  }
});