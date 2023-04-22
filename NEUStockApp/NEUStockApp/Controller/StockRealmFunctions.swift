//
//  StockRealmFunctions.swift
//  NEUStockApp
//
//  Created by Wu Guanguan on 4/19/23.
//

import Foundation
import RealmSwift


extension ViewController {
    
    func getStockValuesFromLocalDB(){

            let stocks = realm.objects(StockPrice.self)
            
            stockInDB.removeAll()
            
            for stock in stocks{
                let stockPrice = StockPrice()
                stockPrice.symbol = stock.symbol
                stockPrice.price = stock.price
                stockPrice.volume = stock.volume
                
                stockInDB.append(stockPrice)
            }
                tblView.reloadData()
        // At this point, we have stale/local data
        // we want to make network calls and get real data
        getStockDataFromAPI()
    }
    
    func findAndAddStockToLocalDB(symbol : String){
        
        // check does te stock exist in DB
        if doesStockExistInDB(symbol){
            // Since stock already exists do not do anything
            return
        }
        getAndAddStockValueInDB(symbol)
        // if the stock already exist in the DB then don't do anything
        // Make a network call for the stock symbol
        // if the stock symbol exist, then add it to the DB
        //Otherwise don't do anything
    }
    
    func doesStockExistInDB(_ symbol : String) -> Bool{
        let data = realm.object(ofType: StockPrice.self, forPrimaryKey: symbol)
        if data != nil{
            return true
        }else{
            return false
        }
    }
    
    func addDataToRealmDB(stock: StockPrice){
        do {
            try self.realm.write{
                self.realm.add(stock, update: .modified)
            }
        } catch let error as NSError {
            print("Unable to add value to the DB \(error)")
        }
    }
    
    func removeStockFromDB(symbol: String){
        do {
            guard let object = realm.objects(StockPrice.self).filter("symbol = %@", symbol).first
            else {return}
                try! realm.write{
                        realm.delete(object)
                    }
            } catch let error as NSError {
                print("error - \(error.localizedDescription)")
            }
        }
    
}
