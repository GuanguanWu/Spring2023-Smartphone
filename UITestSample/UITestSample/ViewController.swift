//
//  ViewController.swift
//  UITestSample
//
//  Created by Wu Guanguan on 4/21/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        if (email != "wgg@icloud.com" || password != "password"){
            lblStatus.isHidden = false
            lblStatus.text = "Please enter valid email/password."
            return
        }
        lblStatus.isHidden = true
        // perform Segue with identifier
        performSegue(withIdentifier: "SegueLogin", sender: self)
    }
    
}

