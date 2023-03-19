//
//  ViewController.swift
//  SegueExample
//
//  Created by Wu Guanguan on 3/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    var welcomeName = ""

    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecondVCAction(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            guard let name = txtName.text else {return}
            secondVC.welcomeName = name
        }
    }
    
}

