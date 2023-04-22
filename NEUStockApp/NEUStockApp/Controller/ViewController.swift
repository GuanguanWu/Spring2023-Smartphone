//
//  ViewController.swift
//  NEUStockApp
//
//  Created by Wu Guanguan on 2/18/23.
//

import UIKit

import RealmSwift

class ViewController: UIViewController{
    
    @IBOutlet weak var tblView: UITableView!
    
    var txtField: UITextField?
    var stockInDB: [StockPrice] = [StockPrice]()
    let realm = try! Realm()
    var stockSymbolForSegue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
        getStockValuesFromLocalDB()
    }

    @IBAction func addStockToDB(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Stocks to DB", message: "Type Stock Symbol", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default){ action in
            guard let symbol = self.txtField?.text else {return}
            if symbol == "" {return}
            self.findAndAddStockToLocalDB(symbol: symbol.uppercased())
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
    
}

