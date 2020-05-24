import { StyleSheet } from 'react-native';
import COLORS from './colors'

const globalStyles = StyleSheet.create({
    headerLeft: {
        color: COLORS.WHITE, 
        paddingLeft: 10
    },
    headerTitleStyle: {
        backgroundColor: COLORS.WAVEHQ_PRIMARY 
    }
});

export default globalStyles