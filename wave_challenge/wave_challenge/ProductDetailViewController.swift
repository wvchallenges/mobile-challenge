//
//  ProductDetailViewController.swift
//  wave_challenge
//
//  Created by Seul Lee on 2017-04-04.
//  Copyright © 2017 Tobok Lee. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var product: Product!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = product.name
        self.price.text = product.price
        self.productDescription.text = product.description
        self.productId.text = String(product.id)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
