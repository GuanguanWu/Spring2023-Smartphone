//
//  ViewController.swift
//  CustomTabeViewCellXib
//
//  Created by Wu Guanguan on 2/21/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let imageNames = ["Seattle0", "Seattle1", "Seattle2", "Seattle3", "Seattle4", "Seattle5", "Seattle6"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        cell.imageContainer.image = UIImage(named: "Seattle\(indexPath.row)")
        cell.lblImage.text = "Seattle\(indexPath.row)"
        
        return cell
    }

}

