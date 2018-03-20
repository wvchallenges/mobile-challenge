//
//  CustomNetworkAdaptor.swift
//  WaveChallenge
//
//  Created by Akash Patel on 2018-03-07.
//  Copyright © 2018 Akash Patel. All rights reserved.
//

import UIKit
import Alamofire

class CustomNetworkAdatptor {
    
    private struct Constants {
        static let baseURL = "https://api.waveapps.com/businesses/"
        static let accessToken = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
        
    }
    
    class func fetchProductList(businessID:String, success:@escaping ([ProductDetails])->Void) {
        let productURL = URL(string: Constants.baseURL.appending(businessID).appending("/products/"))
        let header = ["Authorization": "Bearer " + Constants.accessToken]
        
        Alamofire.request(productURL!, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: header).validate().responseString(completionHandler: { response in
            switch response.result {
            case .success :
                guard let responceObject = response.result.value else {
                    return
                }
                guard let products = self.mapProductData(responce: responceObject) else {
                    return
                }
                success(products)
            case .failure:
                print("failed")
            }
            
        })
    }
    
   private static func mapProductData (responce: String)->[ProductDetails]? {
        
        let decoder = JSONDecoder()
        guard let data = responce.data(using: .utf8) else {
            return nil
        }
        
        guard let products:[ProductDetails] = try! decoder.decode([ProductDetails].self, from: data) else {
            return nil
        }
      return products
        
    }
}

