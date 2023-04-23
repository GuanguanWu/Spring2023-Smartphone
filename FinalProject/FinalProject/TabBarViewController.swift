//
//  TabBarViewController.swift
//  FinalProject
//
//  Created by Wu Guanguan on 4/22/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = viewControllers?[0] as! HomeViewController
        let uploadPicVC = viewControllers?[1] as! UploadImageViewController
//        uploadPicVC.setImagesDelegate = homeViewController
        uploadPicVC.uploadProtocol = homeViewController.self
    }
}
