//
//  HomeViewController.swift
//  InstaWithoutDBAndCloud
//
//  Created by Wu Guanguan on 4/21/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {

    var images : [UIImage] = [UIImage]()
    var locations = [String]()
    var imageTitles : [String] = [String]()
    var uploadImageVC : UIViewController?
    
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = navigationController?.tabBarController
        uploadImageVC = navigationController?.tabBarController?.viewControllers?[0]
        print(uploadImageVC?.title)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            imageTitles.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        for (idx, e) in cell.contentView.subviews.enumerated() {
            switch idx {
            case 0:
                let te = e as! UIImageView
                te.image = images[indexPath.row]
            case 1:
                let te = e as! UILabel
                te.text = locations[indexPath.row]
            case 2:
                let te = e as! UILabel
                te.text = imageTitles[indexPath.row]
            default:
                continue
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 350
        }
        
    func uploadedImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        images.append(img)
        locations.append(locationImg)
        imageTitles.append(titleImg)
            
        tblView.reloadData()
    }

}
