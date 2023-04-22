//
//  StocksTableViewControllerCode.swift
//  NEUStockApp
//
//  Created by Wu Guanguan on 4/19/23.
//

import Foundation
import UIKit


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockInDB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let symbol = stockInDB[indexPath.row].symbol
        let price = stockInDB[indexPath.row].price
        cell.textLabel?.text = "\(symbol): \(price)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let stock = stockInDB[indexPath.row]
            stockInDB.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            removeStockFromDB(symbol: stock.symbol)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let stock = stockInDB[indexPath.row]
        stockSymbolForSegue = stock.symbol
        performSegue(withIdentifier: "SegueStockDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueStockDetails"{
            let vc = segue.destination as! StockDetailsViewController
            vc.stockSymbol = stockSymbolForSegue
        }
    }
}
 
