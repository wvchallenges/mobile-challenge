//
//  DataMapper.swift
//  wave_challenge
//
//  Created by Seul Lee on 2017-04-04.
//  Copyright © 2017 Tobok Lee. All rights reserved.
//

import Foundation

public class DataMapper {
    public func jsonSerializer(jsonData: Data) -> [AnyObject]? {
        do{
            let json = try JSONSerialization.jsonObject(with: jsonData, options:.allowFragments) as! [AnyObject]
            return json
        } catch let error as NSError{
            print(error)
        }
        
        return nil
    }
    
    public func mapData(jsonData: Data) -> Any? {
        let json = jsonSerializer(jsonData: jsonData)
        
        let mappedData = mapping(json:json!)
        return mappedData
    }
    
    private func mapping(json: [AnyObject]) -> Any? {
        var itemList: Array<Product> = []
        
        for item in json {
            let dict = item as! NSDictionary
            let name = dict["name"]
            let id = dict["id"]
            let description = dict["description"]
            let price = dict["price"]
            let active = dict["active"]
            
            itemList.append(Product(name: name as! String!,
                                    id: id as! Int!,
                                    description: description as! String!,
                                    price: price as! Int!,
                                    active: active as! Bool!))
        }
        
        return itemList
    }
}
