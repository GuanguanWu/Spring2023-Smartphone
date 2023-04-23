//
//  HomeViewController.swift
//  ThreeTabBar
//
//  Created by Wu Guanguan on 4/22/23.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {
    
    let realm  = try! Realm()

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
        getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            imageTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell

            cell.imageContainer.image = images[indexPath.row]
            cell.lblTitle.text = imageTitles[indexPath.row]
            cell.lblLocation.text = locations[indexPath.row]

            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 500
        }
    
    func uploadedImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        images.append(img)
        locations.append(locationImg)
        imageTitles.append(titleImg)
            
        tblView.reloadData()
    }
    
    func getData(){
        
        let imageInfos = realm.objects(ImageData.self)
                
                
        for imageInfo in imageInfos {
            guard let img = UIImage(data: imageInfo.Image!) else { return }
            let title = imageInfo.title
            let location = imageInfo.location
            
            images.append(img)
            imageTitles.append(title)
            locations.append(location)
        }
         tblView.reloadData()
    }
    

}
