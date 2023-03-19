//
//  ViewController.swift
//  AssigmentMakingApiCall
//
//  Created by Wu Guanguan on 3/18/23.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockCompanyName: UILabel!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    @IBOutlet weak var lblStockWebsite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func getStockDetails(_ sender: Any) {
        getStockInfo()
    }
    
    func getStockInfo(){
        guard let symbol = txtStockSymbol.text else {return}
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        
        AF.request(url).responseJSON { response in
            if response.error != nil {
                print("Error in response")
                return
            }

            print(response.data!)
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}

            
            let companyName = stock["companyName"].stringValue
            let price = stock["price"].floatValue
            let website = stock["website"].stringValue
            
            self.lblStockCompanyName.text = "Company Name : \(companyName)"
            self.lblStockPrice.text = "Price : \(price) $"
            self.lblStockWebsite.text = "Website : \(website)"
    }
    }
}

