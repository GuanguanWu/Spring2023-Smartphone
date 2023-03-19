//
//  ViewController.swift
//  ProtocolsAndDelegate
//
//  Created by Wu Guanguan on 3/17/23.
//

import UIKit

class ViewController: UIViewController, SetStatusDelegate {
    
    // Steps for protocols and Delegate
    /*
     1. Create a Swift file which has a protocol.
     2. This protocol will have the functions that would have to be implemented when someone conforms to it.
     3. In the second view controller we will add an optional variable for the protocol
     4. In the second view controller whenever an action is taken we'll call the protocal function
     5. In the first view vontroller conform to the protocol
     6. You would have to implement the function in the protocol
     7. In the function do your implementation (Uidate UI etc.  )
     8. When we are going to the second VC, start listening to the second VC's variable defined in step 3.
     */

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC" {
            
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.setStatusDelegate = self
            
            guard let name = txtName.text else {return}
            secondVC.name = name
        }
    }
    
    func setStatus(status: String) {
        lblStatus.text = "My Status is : \(status)"
    }
    
}

