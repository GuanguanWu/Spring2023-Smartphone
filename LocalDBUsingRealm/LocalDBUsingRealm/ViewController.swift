//
//  ViewController.swift
//  LocalDBUsingRealm
//
//  Created by Wu Guanguan on 3/17/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // print(Realm.Configuration.defaultConfiguration.fileURL!)
        //testFunction()
        getValues()
    }
    
    func getValues(){
        do{
            let stocks = realm.objects(StockPrice.self)
            print(stocks)
            
        }  catch let error as NSError {
            print("Unable to add value to the DB")
        }
    }
    
    func testFunction(){
        let tsla: StockPrice = StockPrice()
        tsla.symbol = "TSLA"
        tsla.price = 299.99
        tsla.volume = 21324344
        
        let msft: StockPrice = StockPrice()
        msft.symbol = "MSFT"
        msft.price = 366.66
        msft.volume = 13456654
        
        do {
            try realm.write{
                realm.add(msft, update: .modified)
            }
        } catch let error as NSError {
            print("Unable to add value to the DB")
        }
    }
}




