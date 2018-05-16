//
//  ApiManager.swift
//  Wave-challenge
//
//  Created by Siddhesh Mahadeshwar on 16/05/18.
//  Copyright © 2018 net.siddhesh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum Result<T> {
    case Success(T)
    case Failure(String)
}
//We can store accessToken in keychain or userDefaults.
let accessToken = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
let bussinessId = "89746d57-c25f-4cec-9c63-34d7780b044b"
let bussiness = "/businesses/"
let Schema = "https"
//Setup for different schemas.
#if DEVELOPMENT
let HOST = "api.waveappsDev.com"
#elseif QA
let HOST = "api.waveappsQA.com"
#else
let HOST = "api.waveapps.com"
#endif
let serverURL = Schema+"://"+HOST

class ApiManager: NSObject {

    static let shared = ApiManager()
    
    func getProducts(bussinessId:String, completion: @escaping (Result<[Product]>) -> ()) {
        //we can setup header in init method, so that all other methods can use it instead of initializing everytime.
        let header = ["Authorization": "Bearer " + accessToken]
        Alamofire.request(serverURL+bussiness+bussinessId+"/products/", headers: header).validate().responseJSON { responseObject in
            switch responseObject.result {
            case .success(let value):
                let json = JSON(value)
                guard let productsArray = json.array else {
                    completion(Result.Failure("Data is missing"))
                    return
                }
                //get array of products from product model.
                completion(Result.Success(Product.all(rawArray: productsArray)))
            case .failure(let error):
                completion(Result.Failure(error.localizedDescription))
            }
        }
    }
}
