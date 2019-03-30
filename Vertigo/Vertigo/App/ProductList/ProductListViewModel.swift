//
//  ProductListViewModel.swift
//  Vertigo
//
//  Created by Bushra Shahid on 3/30/19.
//  Copyright © 2019 Bushra Shahid. All rights reserved.
//

import UIKit

class ProductListViewModel {
    
    enum State {
        case initial
        case loading
        case products([Product])
    }
    
    private let service: ProductListService
    var state: State = .initial {
        didSet {
            stateChangeHandler?(state)
        }
    }
    // This can be improved by implementing an observable type so the state is directly observable instead of implementing an explicit change handler
    var stateChangeHandler: ((State) -> Void)?
    
    init(service: ProductListService) {
        self.service = service
    }
    
    func loadProducts() {
        state = .loading
        
        service.fetchProducts { [weak self] (products) in
            self?.state = .products(products)
        }
    }

}
