//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Wu Guanguan on 4/22/23.
//

import UIKit
import RealmSwift

class HomeViewController: UITabBarController, UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {
    
    let realm = try! Realm()
    
    var images : [UIImage] = [UIImage]()
    var locations = [String]()
    var imageTitles : [String] = [String]()
    var uploadImageVC : UIViewController?
    
//    let test = ["Ashish", "Mark","Tom"]
    
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        uploadImageVC = navigationController?.tabBarController?.viewControllers?[0]
//        print(uploadImageVC?.title)
        let controller = navigationController?.tabBarController
        uploadImageVC = navigationController?.tabBarController?.viewControllers?[0]
        print(uploadImageVC?.title)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            imageTitles.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel!.text = test[indexPath.row]
//        return cell

        
        
        
        
        
    let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell

        cell.imageContainer.image = images[indexPath.row]
        cell.lblTitle.text = imageTitles[indexPath.row]
        cell.lblLocation.text = imageTitles[indexPath.row]

        return cell
}

////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////            return 600
////        }
        
    func uploadedImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        images.append(img)
        locations.append(locationImg)
        imageTitles.append(titleImg)
            
        tblView.reloadData()
    }

    

}
