//
//  EducateMeViewController.swift
//  cse460unit5projectphaseI
//
//  Created by nanqiao chen on 6/23/20.
//  Copyright © 2020 nanqiao chen. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class EducateMeViewController: UIViewController {

    
    @IBOutlet weak var answer_of: UITextView!
    var healthInfoList =  [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(healthInfoList[0])
let vc = SFSafariViewController(url: URL(string: healthInfoList[0])!)

present(vc, animated: true)
        
    }
    
 
    

}
