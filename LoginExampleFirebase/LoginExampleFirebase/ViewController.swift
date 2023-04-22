//
//  ViewController.swift
//  LoginExampleFirebase
//
//  Created by Wu Guanguan on 4/19/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let keyChain = KeychainService().keyChain
        if keyChain.get("uid") != nil{
            performSegue(withIdentifier: "SegueDashboard", sender: self)
        }
    }
    
    func addKeyChainAfterLogin(uid : String){
        let keyChain = KeychainService().keyChain
        keyChain.set(uid, forKey: "uid")
    }


    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        if email.isEmail == false{
            lblStatus.text = "Enter valid email"
            lblStatus.isHidden = false
            return
        }
        
        if password.isValidPassword == false{
            lblStatus.text = "Enter valid password"
            lblStatus.isHidden = false
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                strongSelf.lblStatus.isHidden = false
                return
            }
            strongSelf.lblStatus.text = "Login sucessful"
            strongSelf.lblStatus.isHidden = true
            
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            strongSelf.addKeyChainAfterLogin(uid: uid)
            
            strongSelf.performSegue(withIdentifier: "SegueDashboard", sender: strongSelf)

        }
    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        
        performSegue(withIdentifier: "SegueRegister", sender: self)
    }
    
}

