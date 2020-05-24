import { TextStyle } from 'react-native';

type TypeScaleType = { [key: string]: { [key: string]: TextStyle } };

const TypeScale: TypeScaleType = {
  font: {
    regular22: {
      fontSize: 22,
      fontWeight: 'bold',
    },
    regular28: {
      fontSize: 28,
      fontWeight: 'bold',
    },
  },
};

export default TypeScale;
