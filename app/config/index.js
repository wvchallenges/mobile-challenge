import DebugConfig from './debug';

if (__DEV__) {
	// If ReactNative's yellow box warnings are too much, it is possible to turn
	// it off, but the healthier approach is to fix the warnings.  =)
	/* eslint-disable no-console*/
	console.disableYellowBox = DebugConfig.yellowBox;
	// console.ignoredYellowBox = ['Warning:'];
}
