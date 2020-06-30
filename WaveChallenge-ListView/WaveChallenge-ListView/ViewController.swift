//
//  ViewController.swift
//  WaveChallenge-ListView
//
//  Created by John De Guzman on 2020-06-30.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    let productService = ProductService()
   
    private var dataSource: UICollectionViewDiffableDataSource<Section, Product>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        setupCollectionViewDataSource()
        callService()
    }

    private func setupCollectionView() {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        collectionView.collectionViewLayout = layout
        
    }
    
    private func setupCollectionViewDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Product> { cell, indexPath, item in
            
            var contentConfiguration = cell.defaultContentConfiguration()
            
            contentConfiguration.text = "\(item.name)"
            contentConfiguration.secondaryText = item.price.getPrice()
            contentConfiguration.textProperties.color = .lightGray
            
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Product>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Product) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                for: indexPath,
                                                                item: itemIdentifier)
        }
        
        collectionView.dataSource = dataSource
        
    }
    
    private func callService() {
        productService.getProducts(businessId: NetworkingConstants.businessId, onComplete: { [weak self] item, error in
           if let item = item {
                self?.products = item
                self?.updateCollectionView()
            }
        })
    }
    
    private func updateCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.main])
        snapshot.appendItems(products, toSection: .main)
        print("NUMBER OF ITEMS: \(snapshot.numberOfItems)")
        dataSource.apply(snapshot)
    }
   
}
