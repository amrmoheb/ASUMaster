



import Foundation
class CalculatorWeb : CalculatorProtocol{
    var gender: Gender = Gender.male
    var height: Double = 0.0
    
    var weight: Double = 0.0
    var valueOfBMI = 0.0
    var messageValueText = ""
    func setInputs(height: Double, weight: Double , gender : Gender) {
        self.height = height
        self.weight = weight
        self.gender = gender
    }
    
    func  remoteCalc(compliationHandler: @escaping  ((Response?) -> Void)) {
        
        let urlAsString = "http://webstrar99.fulton.asu.edu/page3/Service1.svc/calculateBMI?height=\(self.height)&weight=\(self.weight)&gender=\(self.gender)"
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
                compliationHandler(nil)

            }
            guard let json = result else{
                compliationHandler(nil)

                return
            }
            self.valueOfBMI = json.bmi
            self.messageValueText = json.risk
            compliationHandler(json)
        })
        task.resume()
    
    /*    let json = Response(bmi: 12, healthInfo: ["https://www.google.com/" , "https://www.yahoo.com"], risk: "you will die")
        self.valueOfBMI = json.bmi
        self.messageValueText = json.risk
        compliationHandler(json)*/
    }
    func calcBMI() -> Double {
  
        return valueOfBMI
    }
    
    func labelValue() -> String {
        //DOTO
        return "\(valueOfBMI)"
    }
    
    func messageValue() -> String {
        //TODO
        return "\(messageValueText)"
    }
    
 
    
    
}
