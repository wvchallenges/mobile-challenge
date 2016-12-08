//
//  WaveClient.swift
//  WaveInterView
//
//  Created by Zefeng Qiu on 2016-12-07.
//  Copyright © 2016 Zefeng Qiu. All rights reserved.
//

import Foundation


class WaveClient: NSObject {
  
  /* Inplement Singleton pattern */
  static let sharedInstance = WaveClient()
  
  /* products to be show in tableView */
  var products: [WaveProduct]!
  
  
  override init() {
    super.init()
    
    products = []
  }
  
  
  /* Getting product list information using Wave APIs*/
  
  func getProductListBaseOnBusinessID(completionHandlerForGetList: @escaping (_ result: Bool, _ error: String?) -> Void) {
    
    let parameters: [String: AnyObject] = [ParameterKeys.APIAccessToken: ParameterValues.APIAccessToken as AnyObject]
    let paths: [String] = [Constants.ApiBusinessesPath, Constants.BusinessID]
    let request = URLRequest(url: URLFromParameters(paths, parameters, withPathExtension:WaveClient.Methods.Products))
    
    let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error ) in
      
      //check error
      guard (error == nil) else {
        completionHandlerForGetList(false, "There was an error with your request: \(error)")
        return
      }
      
      //check status code
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
        completionHandlerForGetList(false, "Your request returned a status code other than 2xx!")
        return
      }
      
      //guard data is not nil
      guard let data = data else {
        completionHandlerForGetList(false, "No data was returned by the request!")
        return
      }
      
      // parse data to JSON
      let contentJSON: [[String:AnyObject]]!
      do {
        contentJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:AnyObject]]
      } catch {
        print("Could not parse the data as JSON: '\(data)'")
        return
      }

      self.parseJSONInfoToWaveProduct(contentJSON: contentJSON)
      
      completionHandlerForGetList(true, nil)
    })
  
    task.resume()
  }
  
  
  

}


//MARK: class helper functions
extension WaveClient {
  
  //parse JSON to WaveProduct 
  
  fileprivate func parseJSONInfoToWaveProduct(contentJSON: [[String:AnyObject]]) {
    for content in contentJSON {
      guard let productID = content[JSONResponseKey.ProductID] as? Int else {
        print("cannot parse id ")
        return
      }
      guard let productName = content[JSONResponseKey.ProductName] as? String else {
        print("cannot parse name")
        return
      }
      guard let productPrice = content[JSONResponseKey.ProductPrice] as? Int else {
        print("cannot parse price")
        return
      }
      
//      print("\(productID) -- \(productName) : \(productPrice)")
      products.append(WaveProduct(id: productID, name: productName, price: Float(productPrice)))
    }
  }
  
  
  // create a URL from parameters
  fileprivate func URLFromParameters(_ paths: [String], _ parameters: [String:AnyObject], withPathExtension: String? = nil) -> URL {
    
    var components = URLComponents()
    components.scheme = WaveClient.Constants.ApiScheme
    components.host = WaveClient.Constants.ApiHost
    
    var path = ""
    for pth in paths {
      path += "/\(pth)"
    }
    components.path = path + (withPathExtension ?? "")
    components.queryItems = [URLQueryItem]()
    
    for (key, value) in parameters {
      let queryItem = URLQueryItem(name: key, value: "\(value)")
      components.queryItems!.append(queryItem)
    }
    
    return components.url!
  }
  
}
