//
//  ViewController.swift
//  WaveChallenge
//
//  Created by Daniel on 11/14/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let urlPath:String = "https://api.waveapps.com/businesses/89746d57-c25f-4cec-9c63-34d7780b044b/products/"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        urlRequest(urlPath)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




    
}

