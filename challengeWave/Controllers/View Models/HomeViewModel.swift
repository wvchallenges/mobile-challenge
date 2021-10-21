//
//  HomeViewModel.swift
//  challengeWave
//
//  Created by Leandro Falbo Barros on 2021-10-20.
//

import Foundation

struct HomeViewModel {
    
    // MARK: - Properties
    
    let products: [ProductElement]
    
    // MARK: -
    
    var numberOfProducts: Int {
        return products.count
    }
    
    func getPrice(value : Int) -> String {
        return String(format: "$%.02f", Double(value))
    }
    
}
