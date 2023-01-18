//
//  ViewController.swift
//  Hello World
//
//  Created by Wu Guanguan on 1/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblExample: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I'm inside viewDidLoad() function")
    }

    @IBAction func pressMeAction(_ sender: UIButton) {
        lblExample.text = "Hello World"
    }
}
