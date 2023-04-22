//
//  StocksNetworkingCode.swift
//  NEUStockApp
//
//  Created by Wu Guanguan on 4/19/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftSpinner


extension ViewController{
    func getAndAddStockValueInDB(_ symbol : String){
        // Make a network call to the server, add the return value to DB. Otherwise, do nothing
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Stock Price for \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in response")
                return
            }
            // At this point I got a valid response
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
            
            let symbol = stock["symbol"].stringValue
            let price = stock["price"].floatValue
            let volume = stock["volume"].int64Value
            
            let newStock = StockPrice()
            newStock.symbol = symbol
            newStock.price = price
            newStock.volume = volume
            
            self.addDataToRealmDB(stock: newStock)
            self.stockInDB.append(newStock)
            self.tblView.reloadData()
        }
    }
    
    func getStockDataFromAPI(){
        for stock in stockInDB{
            // Make network calls for each of the stock and update the value
            let url = "\(baseURL)\(stock.symbol)?apikey=\(apiKey)"
            AF.request(url).responseJSON { response in
                if response.error != nil {
                    print("Error in response")
                    return
                }
                // At this point I got a valid response
                guard let rawData = response.data else {return}
                guard let jsonArray = JSON(rawData).array else {return}
                guard let stock = jsonArray.first else {return}
                
                let symbol = stock["symbol"].stringValue
                let price = stock["price"].floatValue
                let volume = stock["volume"].int64Value
                
                let newStock = StockPrice()
                newStock.symbol = symbol
                newStock.price = price
                newStock.volume = volume
                
                print("New Stock Symbol = \(symbol)")
                print("New Stock Price = \(price)")
                print("New Stock Volume = \(volume)")
                
                if let i = self.stockInDB.firstIndex(where: { $0.symbol == symbol}){
                    self.stockInDB[i].price = price
                    self.stockInDB[i].volume = volume
                    self.tblView.reloadData()
                }
            }
        }
    }
}
