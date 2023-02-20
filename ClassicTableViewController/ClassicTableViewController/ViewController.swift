//
//  ViewController.swift
//  ClassicTableViewController
//
//  Created by Wu Guanguan on 2/19/23.
//

import UIKit

/*
 1. Add table view on the view controller, strech it across the full screen
 2. Add a table view cell to the table view above, put name of "cell" in the reusable identifier section
 3. Conform 遵照 to the protocols UITableViewDelegate, UITableDataSource
 4. Add stub functions numberOfRowsInSection and CellForRowAt
 5. Add tableview.delegate and tableview.dataSource  = self in viewDidLoad
 6. Add an array which will contain values to be displayed
 7. In the numberOfRowsInSection return the array.count
 8. In the CellForRowAt function add dequeueResuableCell function and populate the cell
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let friends = ["Jack","Bob","Bill","Peter","Lily","Jack","Bob","Bill","Peter","Lily","Jack","Bob","Bill","Peter","Lily","Jack","Bob","Bill","Peter","Lily","Jack","Bob","Bill","Peter","Lily","Jack","Bob","Bill","Peter","Lily","Jack","Bob","Bill","Peter","Lily","Jack","Bob","Bill","Peter","Lily","Jack","Bob","Bill","Peter","Lily"]

    @IBOutlet weak var tblView: UITableView! 
    override func viewDidLoad() {
        super.viewDidLoad()
//        tblView.delegate = self
//        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = friends[indexPath.row]
        
        return cell
    }


}

