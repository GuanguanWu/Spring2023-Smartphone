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
    
    var txtField: UITextField?
    
    var stockSymbol = ""
    
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
    
    @IBAction func addStockToDB(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Stocks to DB", message: "Type Stock Symbol", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default){ action in
            guard let symbol = self.txtField?.text else {return}
            self.findAndAddStockToLocalDB(symbol: symbol)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel){ action in
        }
        
        alertController.addTextField{ lblTextField in
            self.txtField = lblTextField
            lblTextField.placeholder = "Type Stock value"
        }
        
        // add the 2 buttons in alertController
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        // alertController is not presented on the screen, I only created the variable, so I'll add it on the screen
        self.present(alertController, animated: true)
    }
    
    func findAndAddStockToLocalDB(symbol : String){
        // if the stock already exist in the DB then don't do anything
        
        // Make a network call for the stock symbol
        
        // if the stock symbol exist, then add it to the DB
        
        //Otherwise don't do anything
    }
    
}

