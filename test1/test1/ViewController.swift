//
//  ViewController.swift
//  test1
//
//  Created by Kevin Naik on 28/06/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterAge: UITextField!
    
    @IBOutlet weak var Output: UILabel!
    @IBAction func Click(_ sender: Any) {
        
        if let age = enterAge.text {
            Output.text = "You are " + age + " years old."
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

