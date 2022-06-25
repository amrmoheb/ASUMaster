//
//  ViewController.swift
//  cse460unit5projectphaseI
//
//  Created by nanqiao chen on 6/22/20.
//  Copyright © 2020 nanqiao chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func localCalc(_ sender: Any) {
        performSegue(withIdentifier: "idealWaightLocalCalc", sender: self)
    }
    @IBAction func apiCalc(_ sender: Any) {
        performSegue(withIdentifier: "idealWaightAPI", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "idealWaightAPI") {
            let vc = segue.destination as! subsecondViewController
            vc.modalPresentationStyle = .fullScreen
            vc.calculator = CalculatorWeb()
        }else if (segue.identifier == "idealWaightLocalCalc"){
            let vc = segue.destination as! subfirstViewController
            vc.modalPresentationStyle = .fullScreen
           
            vc.calculator = CalculatorLocal()
        }
    }
}

