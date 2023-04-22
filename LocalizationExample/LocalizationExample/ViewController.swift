//
//  ViewController.swift
//  LocalizationExample
//
//  Created by Wu Guanguan on 4/20/23.
//

import UIKit

/*
 Steps for Localization of strings:
 1. Add Localization language in your app.
    Click on the Application Project name.
    Click on the project name in Project section.
    In localization click and add your language.
 
 2. Add a new string file call it Localizable
    In that string file add the Key Value for the strings you want to be translated.
    Click on Localize button on the right side of the Inspector pane.
    Check all the languages you want to localize.
    Now the localizable file should have 2-3 files inside it which will correspond to the languages.
    Change the Value to Localized string for each language.
 
 3. Create a new folder and add a new Swift file called LocalizationUtils.
    Add variables for the Keys of the Key Value Pairs like following.
    var strHelloWorld = NSLocalizedString("hello_world", comment: "This is hello world string")

 4. Create outlets for the UI elements you want to localize.
   In the viewdidload function use the variable created above for the string of the UI element.

Now when you change language the text will be translated.
 */

/*
 Steps for creating icons:
 
 1. Go to Canva.com
 2. Create an icon of 1024X1024
 3. Download icon
 4. Go to appicon.co
 5. Select ipad and iphone and upload the icon
 6. Download the icons from appicon.co it will give you zip file; unzip the file
 7. in your app go to Assets and click on app Icon and right click and click show in finder
 8. Delete the folder AppIcon.appiconset and replace it with the AppIcon.appiconset folder created from appicon.co
 */

class ViewController: UIViewController {

    @IBOutlet weak var lblHelloWorld: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHelloWorld.text = strHelloWorld
    }


}

