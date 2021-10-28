import React from "react";
import { FlatList, SafeAreaView, StatusBar, Text, View } from "react-native";

const ProductScreen = () => {

    const data = [{
        id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
        title: 'hello world',
    },{
        id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28bb',
        title: 'hello world',
    },{
        id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28bc',
        title: 'hello world',
    }]

    const renderItem = ({
        item
    }: any) => (
        <View style={{
        }}>
            <Text style={{
                fontSize: 24,
            }}>
                {item.title}
            </Text>
        </View>
      );

    return (
        <SafeAreaView style={{
            flexDirection: "column",
        }}>
          <StatusBar  />
          <FlatList style={{
          }} data={data} renderItem={renderItem} />
        </SafeAreaView>
      );
}

export default ProductScreen;