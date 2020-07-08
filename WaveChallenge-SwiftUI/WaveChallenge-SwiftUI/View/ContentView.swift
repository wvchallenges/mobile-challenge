//
//  ContentView.swift
//  WaveChallenge-SwiftUI
//
//  Created by John De Guzman on 2020-06-29.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: ProductStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.products) {item in
                    ListCell(title: item.name, subtitle: item.price.getPrice())
                }
            }
            .navigationTitle("Products")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testProductStore)
    }
}

let testProduct = Product(id: 123, price: 29.9, name: "Dog")
let testProductStore = ProductStore(products: [testProduct])
