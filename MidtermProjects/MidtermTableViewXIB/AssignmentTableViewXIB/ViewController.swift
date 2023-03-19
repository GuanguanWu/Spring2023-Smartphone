//
//  ViewController.swift
//  AssignmentTableViewXIB
//
//  Created by Wu Guanguan on 2/22/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageNames = ["ChichenItza", "ChristTheRedeemer", "Colosseum", "MachuPicchu", "Petra", "TajMahal", "TheGreatWall"]
    let lblNames = ["ChichenItza", "ChristTheRedeemer", "Colosseum", "MachuPicchu", "Petra", "TajMahal", "TheGreatWall"]
    
    var selectedIndex = 0

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "segueIdentifier", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueIdentifier" {
            let secondVC = segue.destination as! DetailsViewController
            secondVC.secondVCSelectedIndex = selectedIndex
            
        }
    }

    
}
