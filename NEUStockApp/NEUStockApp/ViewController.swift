//
//  ViewController.swift
//  NEUStockApp
//
//  Created by Wu Guanguan on 2/18/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockPrice(_ sender: Any) {
        
        guard let symbol = txtStockSymbol.text else {return}
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock Price for \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in response")
                return
            }
            // At this point I got a valid response
            print(response.data!)
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
//            print(stock)
            
            let symbol = stock["symbol"].stringValue
            let price = stock["price"].doubleValue
            let volume = stock["volume"].intValue
            
//            print("Symbol = \(symbol)")
//            print("Price = \(price)")
//            print("Volume = \(volume)")
            self.lblStockPrice.text = "Price = \(price) $"
        }
    }
    
}

