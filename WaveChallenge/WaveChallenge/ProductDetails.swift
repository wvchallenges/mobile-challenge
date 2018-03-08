//
//  ProductDetails.swift
//  WaveChallenge
//
//  Created by Akash Patel on 2018-02-27.
//  Copyright © 2018 Akash Patel. All rights reserved.
//

import Foundation
// This structure stores the details fo the product

struct ProductDetails : Decodable {
    let name : String
    let price : Double
}
