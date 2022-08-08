import React from 'react';
import {Text, View} from 'react-native';
import styles from '../screens/Products/styles';
import {currencyDisplay} from '../utils/helper';

const ListView = ({item}) => {
  return (
    <View style={styles.listView}>
      <View style={{flex: 1}}>
        <Text style={styles.listItemText}>{item.name}</Text>
      </View>
      <View style={{flex: 0.5}}>
        <Text style={[styles.listItemText, {textAlign: 'right'}]}>
          {currencyDisplay('en-CA', item.price)}
        </Text>
      </View>
    </View>
  );
};

export default ListView;
