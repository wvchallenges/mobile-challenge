//
//  WProductModelSpec.swift
//  Wave
//
//  Created by cc on 16/11/30.
//  Copyright © 2016年 Wave. All rights reserved.
//

import Quick
import Nimble
import SwiftyJSON

class WProductModelSpec: QuickSpec {
    override func spec() {
        describe("Deserialize WProductModel") {
            it("Build and return an instance of WProductModel from JSON") {
                let responseJSON = JSON.parse("{\"name\": \"Apples\",\"price\": 2}")
                let model = WProductModel.fromJSON(product: responseJSON)
                expect(model.name).to(equal("Apples"))
                expect(model.price).to(equal(2))
            }
            context("if JSON doesn't have enough information") {
                it("Build and return an instance of WProductModel from JSON without price") {
                    let responseJSON = JSON.parse("{\"name\": \"Apples\"}")
                    let model = WProductModel.fromJSON(product: responseJSON)
                    expect(model.name).to(equal("Apples"))
                    expect(model.price).to(equal(0))
                }
                it("Build and return an instance of WProductModel from JSON without name") {
                    let responseJSON = JSON.parse("{\"price\": 2}")
                    let model = WProductModel.fromJSON(product: responseJSON)
                    expect(model.name).to(equal(""))
                    expect(model.price).to(equal(2))
                }
            }
        }
    }
}
