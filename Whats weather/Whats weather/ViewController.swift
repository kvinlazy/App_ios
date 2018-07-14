//
//  ViewController.swift
//  Whats weather
//
//  Created by Kevin Naik on 14/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var InputCity: UITextField!
    
    @IBOutlet weak var outputData: UILabel!
    @IBAction func ButtonClicked(_ sender: Any) {
        if InputCity.hasText
        {
            var city = InputCity.text
            if (city?.contains(" "))!
                {
                city = city?.replacingOccurrences(of: " ", with: "-")
                }
            
            if let url = URL(string: "https://www.weather-forecast.com/locations/" + (city?.lowercased())! + "/forecasts/latest")
                {
                var message = ""
                    let request = NSMutableURLRequest(url: url)
                
                let task = URLSession.shared.dataTask(with: request as URLRequest) {
                    Data, response, error in
                    
                    if error != nil {
                        
                        print(error!)
                        
                    } else {
                        
                        if let unwrappedData = Data {
                            
                            let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                            var stringsep = "Weather Today </h2>(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                            
                            if let responsearry = dataString?.components(separatedBy: stringsep)
                            {
                                if responsearry.count > 1
                                {
                                    stringsep = "</span>"
                                let newresp = responsearry[1].components(separatedBy: stringsep)
                                    if newresp.count > 1
                                    {
                                        
                                        message = newresp[0].replacingOccurrences(of: "&deg", with: "°")
                                    }
                                }
                            }
                            
                        if message.count > 0
                        {
                            
                        }
                            else
                        {
                            message = "Weather of city enter couldn't be found, Please try again  "
                            }
                            DispatchQueue.main.sync(execute: {
                                
                            
                            self.outputData.text = message
                             })
                            
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                task.resume()
        
            }
        }
        else
        {
            outputData.text = " Please enter city name  "
        }
    
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}


