//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Wu Guanguan on 3/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    var txtField: UITextField?

    @IBOutlet weak var lblStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertController(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Alert Controller Title", message: "Alert Controller Message", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default){ action in
            //The varibale I created in the balck will have access to the OK button in the front
            self.lblStock.text = self.txtField?.text
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

