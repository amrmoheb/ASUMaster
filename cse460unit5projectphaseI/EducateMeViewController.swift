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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // answer_of.text = More[0] + "/n" + More[1] + "/n" + More[2]
        
        let vc = SFSafariViewController(url: URL(string: More[1])!)
        
        present(vc, animated: true)
    }
    

}
