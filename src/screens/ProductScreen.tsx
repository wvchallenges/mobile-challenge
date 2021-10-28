import React from "react";
import { FlatList, SafeAreaView, StatusBar, Text, View } from "react-native";
import useSWR from "swr";
import { productFetcher } from "../api/api";
import { Product } from "../api/models/Product";

const ProductScreen = () => {

    const { data } = useSWR(['/products/', '89746d57-c25f-4cec-9c63-34d7780b044b'], productFetcher)

    // const data = [{
    //     id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
    //     title: 'hello world',
    // },{
    //     id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28bb',
    //     title: 'hello world',
    // },{
    //     id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28bc',
    //     title: 'hello world',
    // }]

    const renderItem = ({
        item
    }: {
        item: Product
    }) => (
        <View style={{
        }}>
            <Text style={{
                fontSize: 24,
            }}>
                {item.name}
            </Text>
        </View>
      );

    return (
        <SafeAreaView style={{
            flexDirection: "column",
        }}>
          <StatusBar  />
          <FlatList style={{
          }} data={data ?? []} renderItem={renderItem} />
        </SafeAreaView>
      );
}

export default ProductScreen;