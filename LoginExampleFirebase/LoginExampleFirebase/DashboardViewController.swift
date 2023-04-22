//
//  DashboardViewController.swift
//  LoginExampleFirebase
//
//  Created by Wu Guanguan on 4/19/23.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        let keyChain = KeychainService()
        keyChain.keyChain.clear()
        self.navigationController?.popViewController(animated: true)
    }
    

}
