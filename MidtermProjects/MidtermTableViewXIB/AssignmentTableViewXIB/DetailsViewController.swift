//
//  DetailsViewController.swift
//  AssignmentTableViewXIB
//
//  Created by Wu Guanguan on 3/18/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var secondVCSelectedIndex = 0
    
    let txtField = ["Chichén Itzá was a major focal point in the Northern Maya Lowlands from the Late Classic (c. AD 600–900) through the Terminal Classic (c. AD 800–900) and into the early portion of the Postclassic period (c. AD 900–1200). The site exhibits a multitude of architectural styles, reminiscent of styles seen in central Mexico and of the Puuc and Chenes styles of the Northern Maya lowlands.",
                    
        " Christ the Redeemer (Portuguese: Cristo Redentor, standard Brazilian Portuguese: [ˈkɾistu ʁedẽˈtoʁ], local pronunciation: [ˈkɾiɕtŭ̥ xe̞dẽˈtoɦ]) is an Art Deco statue of Jesus Christ in Rio de Janeiro, Brazil, created by French sculptor Paul Landowski and built by Brazilian engineer Heitor da Silva Costa, in collaboration with French engineer Albert Caquot. Romanian sculptor Gheorghe Leonida sculpted the face. Constructed between 1922 and 1931, the statue is 30 metres (98 ft) high, excluding its 8-metre (26 ft) pedestal. The arms stretch 28 metres (92 ft) wide.",
                    
        "The Colosseum (/ˌkɒləˈsiːəm/ KOL-ə-SEE-əm; Italian: Colosseo [kolosˈsɛːo]) is an elliptical amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world, despite its age. Construction began under the emperor Vespasian (r. 69–79 AD) in 72[1] and was completed in 80 AD under his successor and heir, Titus (r. 79–81).",
                    
        "Machu Picchu is a 15th-century Inca citadel located in the Eastern Cordillera of southern Peru on a 2,430-meter (7,970 ft) mountain ridge.[2][3] Often referred to as the Lost City of the Incas, it is the most familiar icon of the Inca Empire. It is located in the Machupicchu District within Urubamba Province[4] above the Sacred Valley, which is 80 kilometers (50 mi) northwest of Cusco. ",
                    
                
        "Petra (Arabic: ٱلْبَتْرَاء, romanized: Al-Batrāʾ; Ancient Greek: Πέτρα, Rock, Nabataean: 𐢛𐢚𐢓𐢈‎), originally known to its inhabitants as Raqmu or Raqēmō,[3][4] is a historic and archaeological city in southern Jordan. It is adjacent to the mountain of Jabal Al-Madbah, in a basin surrounded by mountains forming the eastern flank of the Arabah valley running from the Dead Sea to the Gulf of Aqaba.[5] The area around Petra has been inhabited from as early as 7000 BC,[6] and the Nabataeans might have settled in what would become the capital city of their kingdom as early as the 4th century BC.",
                    
        "The Taj Mahal (/ˌtɑːdʒ məˈhɑːl, ˌtɑːʒ-/; lit. 'Crown of the Palace')[4][5][6] is an Islamic ivory-white marble mausoleum on the right bank of the river Yamuna in Agra, Uttar Pradesh, India. It was commissioned in 1631 by the fifth Mughal emperor, Shah Jahan (r. 1628–1658) to house the tomb of his favourite wife, Mumtaz Mahal",
                    
        "The Great Wall of China (traditional Chinese: 萬里長城; simplified Chinese: 万里长城; pinyin: Wànlǐ Chángchéng, literally) is a series of fortifications that were built across the historical northern borders of ancient Chinese states and Imperial China as protection against various nomadic groups from the Eurasian Steppe. "]

    @IBOutlet weak var lblTextView: UILabel!
    
    override func viewDidLoad() {
        lblTextView.text = txtField[secondVCSelectedIndex]
        super.viewDidLoad()
    }
    
}
