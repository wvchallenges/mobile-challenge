import React, { createContext, useState  } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { Icon } from 'native-base';
import SplashScreen from 'react-native-splash-screen';

import ProductsComponent from './app/views/products';
import globalStyles from './app/styles'
console.disableYellowBox = true

export const UserContext = createContext({
  authtoken: '',
  setAuthtoken: () => {
    console.log('called')
  }
})

console.disableYellowBox = true;
const Stack = createStackNavigator();

function App() {
  const [authtoken, setAuthtoken] = useState('Bearer 6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm')// Ideally, this will be set after making api call
  SplashScreen.hide();
  return (
    <UserContext.Provider value={{authtoken, setAuthtoken}}>
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Products" screenOptions={
      { headerLeft: ({color, size}) => <Icon name={'menu'} type={'MaterialCommunityIcons'} style={[globalStyles.headerLeft, { size}]} onPress={() => alert('Hello, from header')}/>,
        headerTitleAlign: 'center', headerTitle: 'Products', headerStyle: globalStyles.headerTitleStyle, 
      headerTitleStyle: { color: 'white'}
      }}>
      <Stack.Screen name="Products" component={ProductsComponent}/>
    </Stack.Navigator>
    </NavigationContainer>
    </UserContext.Provider>
  )
}

export default App;