//
//  ViewController.swift
//  WaveTakeHome
//
//  Created by Henry Savit on 11/20/16.
//  Copyright © 2016 HenrySavit. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class FetchedData {
    var index = 0
    
    var imageurl: String?
    var image: UIImage? = nil
    
    var username: String?
    
    var golds = 0
    var silvers = 0
    var bronzes = 0
    
    init () {
        
    }
    
    convenience init(add: NSDictionary) {
        
        self.init()
        
        if let imageURLString = add["profile_image"] as? String {
            imageurl = imageURLString
            
            if let url = NSURL(string: imageURLString) {
                if let data = NSData(contentsOf: url as URL) {
                    image = UIImage(data: data as Data)
                }
            }
        }
        
        username = add["display_name"] as? String
        if let badges = add["badge_counts"] as? NSDictionary {
            if let gold = badges["gold"] as? Int {
                golds = gold
            }
            
            if let silver = badges["silver"] as? Int {
                silvers = silver
            }
            
            if let bronze = badges["bronze"] as? Int {
                bronzes = bronze
            }
        }
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    let apiEndpoint = "https://api.stackexchange.com/2.2/users?site=stackoverflow"
    
    var tableData: [FetchedData] = []
    
    var CoreDataContainer: NSPersistentContainer {
        return (UIApplication.shared.delegate! as! AppDelegate).persistentContainer
    }
    
    /*
     * Either fetch persisted data from the core data cache, or fetch JSON from the API
     */
    func getData() {
        let request: NSFetchRequest<StackOverflowAPIResults> = StackOverflowAPIResults.fetchRequest()
        request.returnsObjectsAsFaults = false
        let fetchedCachedResults = (try? CoreDataContainer.viewContext.fetch(request)) ?? []
        
        if fetchedCachedResults.count == 0 {
            Alamofire.request(apiEndpoint).responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = data as! NSDictionary
                    
                    if let items = json["items"] as? [NSDictionary] {
                        
                        if items.count > 0 {
                            self.tableData = []
                            
                            for item in items {
                                let createData = FetchedData(add: item)
                                self.tableData.append(createData)
                                self.save(dataObject: createData)
                            }
                            
                            self.activityIndicatorView.stopAnimating()
                            self.tableView.reloadData()
                        }
                    }
                    else {
                        print("Error parsing json")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }
        }
        else {
            self.tableData = []
            for result in fetchedCachedResults {
                
                let data = FetchedData()
                
                data.username = result.value(forKey: "username") as? String
                
                if let imgData = result.value(forKey: "image") as? NSData {
                    data.image = UIImage(data: imgData as Data)
                }
                
                data.golds = result.value(forKey: "golds") as? Int ?? 0
                data.silvers = result.value(forKey: "silvers") as? Int ?? 0
                data.bronzes = result.value(forKey: "bronzes") as? Int ?? 0
                
                self.tableData.append(data)
            }
            
            self.activityIndicatorView.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    /*
     * Persist data to core data
     */
    func save(dataObject: FetchedData) {
        let newData = StackOverflowAPIResults(context: CoreDataContainer.viewContext)
        
        newData.username = dataObject.username
        newData.golds = Int16(dataObject.golds)
        newData.silvers = Int16(dataObject.silvers)
        newData.bronzes = Int16(dataObject.bronzes)
        
        if let image = dataObject.image {
            let newImageData = UIImageJPEGRepresentation(image, 1)
            newData.image = newImageData as NSData?
        }
        
        (UIApplication.shared.delegate! as! AppDelegate).saveContext()
    }
    
    // MARK: UIViewController Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "stackOverflowUserCell") as? TableViewCell)!
        
        let data = tableData[indexPath.row]
        
        cell.gravitarImageView.image = data.image
        cell.username.text = data.username ?? "Username"
        cell.goldMedals.text = "Gold medals: \(data.golds)"
        cell.silverMedals.text = "Silver medals: \(data.silvers)"
        cell.bronzeMedals.text = "Bronze medals: \(data.bronzes)"
        
        return cell
    }
}
