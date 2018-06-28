//
//  ViewController.swift
//  Cat_app
//
//  Created by Kevin Naik on 29/06/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var ouput: UILabel!
    @IBAction func buttonclicked(_ sender: Any) {
        if let age = inputText.text
        {
            if let agee = Int(age)
            {
            let age1 = agee * 7
            
            ouput.text = "Your cat is " + String(age1) + " in cat years"
        
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

