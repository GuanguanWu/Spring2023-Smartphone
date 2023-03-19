//
//  SecondViewController.swift
//  SegueExample
//
//  Created by Wu Guanguan on 3/17/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    var welcomeName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "Welcome \(welcomeName)"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
