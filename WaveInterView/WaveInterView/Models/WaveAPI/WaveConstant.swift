//
//  WaveConstant.swift
//  WaveInterView
//
//  Created by Zefeng Qiu on 2016-12-07.
//  Copyright © 2016 Zefeng Qiu. All rights reserved.
//

import Foundation


extension WaveClient {
  
  
  // MARK: Constants for API
  
  struct Constants {
    
    static let ApiScheme = "https"
    static let ApiHost = "api.waveapps.com"
    static let ApiBusinessesPath = "/businesses"
    static let BusinessID = "89746d57-c25f-4cec-9c63-34d7780b044b"
  }
  
  // MARK: Methods
  
  struct Methods{
    
    static let Products = "/products"
    
  }
  
  // MARK: Parameter Keys
  struct ParameterKeys {
    
    static let APIAccessToken = "access_token"
    
  }
  
  // MARK: Parameter Keys
  struct ParameterValues {
    
    static let APIAccessToken = "6W9hcvwRvyyZgPu9Odq7ko8DSY8Nfm"
    
  }
  
  
  // MARK: Parse Response Keys
  
  struct JSONResponseKey {
    
    static let ProductID = "id"
    static let ProductName = "name"
    static let ProductPrice = "price"
    
  }

  
}
