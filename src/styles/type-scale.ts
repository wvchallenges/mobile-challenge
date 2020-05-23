import { TextStyle } from 'react-native';

type TypeScaleType = { [key: string]: { [key: string]: TextStyle } };

const TypeScale: TypeScaleType = {
  font: {
    regular16: {
      fontSize: 16,
      fontWeight: 'bold',
    },
    regular18: {
      fontSize: 18,
      fontWeight: 'bold',
    },
    regular22: {
      fontSize: 22,
      fontWeight: 'bold',
    },
  },
};

export default TypeScale;
