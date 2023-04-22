//
//  ProtocolUploadImage.swift
//  InstaWithoutDBAndCloud
//
//  Created by Wu Guanguan on 4/21/23.
//

import Foundation
import UIKit

protocol UploadImageProtocol {
    func uploadedImageDelegate(img : UIImage, locationImg: String, titleImg: String)
}
