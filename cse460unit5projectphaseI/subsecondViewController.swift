//
//  subsecondViewController.swift
//  cse460unit5projectphaseI
//
//  Created by nanqiao chen on 6/22/20.
//  Copyright © 2020 nanqiao chen. All rights reserved.
//

import UIKit

var More: [String] = []
class subsecondViewController: UIViewController {
    
    
    @IBOutlet weak var height_text: UITextField!
    
    
    @IBOutlet weak var weight_text: UITextField!
    
    @IBOutlet weak var BMI_label: UILabel!
    
    @IBOutlet weak var Label_label: UILabel!
    
    
    @IBOutlet weak var Message_label: UITextView!
    var calculator : CalculatorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    struct Response: Codable{
        let bmi: Double
        let more: Array<String>
        let risk: String
    }
    
    
    

    @IBAction func Call_BMI_API(_ sender: UIButton) {
        let height = height_text.text!
        let weight = weight_text.text!
        
        
        let urlAsString = "http://webstrar99.fulton.asu.edu/page3/Service1.svc/calculateBMI?height=\(height)&weight=\(weight)"
        print(urlAsString)

        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        
        let task = urlSession.dataTask(with: url, completionHandler: {data, response, error in
           
            guard let data = data, error == nil else{
                print("something went to wrong")
                return
            }
            var result: Response?
            do{
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print("failed to convert \(error.localizedDescription)")
            }
            guard let json = result else{
                return
            }
            More = json.more
            if(json.bmi < 18){
                self.Label_label.textColor = .blue
                self.Message_label.textColor = .blue
            }
            else if(json.bmi >= 18 && json.bmi < 25){
                self.Label_label.textColor = .green
                self.Message_label.textColor = .green
            }
            else if(json.bmi >= 25 && json.bmi < 30){
                self.Label_label.textColor = .purple
                self.Message_label.textColor = .purple
            }
            else{
                self.Label_label.textColor = .red
                self.Message_label.textColor = .red
            }
            DispatchQueue.main.async {
                self.Label_label.text = String(format: "%.2f", json.bmi)
                self.BMI_label.text = "BMI:"
                self.Message_label.text = json.risk
            }
            })
            task.resume()
    }
    
    
    @IBAction func EducateMe(_ sender: Any) {
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    
    

}
