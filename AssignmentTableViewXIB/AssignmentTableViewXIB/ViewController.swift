//
//  ViewController.swift
//  AssignmentTableViewXIB
//
//  Created by Wu Guanguan on 2/22/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageNames = ["Barbeque", "Pancake", "Pasta", "Pizza", "Salad", "Yogurt"]
    let lblNames = ["Barbeque", "Pancake", "Pasta", "Pizza", "Salad", "Yogurt"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell

        cell.imageContainer.image = UIImage(named: imageNames[indexPath.row])
        cell.lblImage.text = lblNames[indexPath.row]

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 500
        }
}
