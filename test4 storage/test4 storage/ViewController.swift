//
//  ViewController.swift
//  test4 storage
//
//  Created by Kevin Naik on 12/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputNumber: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func buttonClicked(_ sender: Any) {
        if (inputName.hasText && inputNumber.hasText)
        {
            UserDefaults.standard.set(inputNumber.text, forKey: inputName.text!)
            UserDefaults.standard.set(inputName.text, forKey: "name")
            output.text = " Successfull "
        }
        else {
            
            output.text = " Enter Value"
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if  (UserDefaults.standard.object(forKey: "name") != nil)
            {
                let key = UserDefaults.standard.object(forKey: "name")
                let key1 = key as! String
                output.text = UserDefaults.standard.object(forKey: key1) as? String
                inputNumber.text = output.text
                inputName.text = key as? String
                
            }
        
    }


}

