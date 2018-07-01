//
//  ViewController.swift
//  Howmayfingers
//
//  Created by Kevin Naik on 01/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputUser: UITextField!
    
    @IBOutlet weak var output: UILabel!
    @IBAction func buttonclicked(_ sender: Any) {
    var num = 0
    if inputUser.hasText
    {
        
            if inputUser.text?.count == 1
            {
            output.text = "Checking answer ..."
            num = Int.random(in: 1 ... 5)
                
                if num == Int(inputUser.text!)
                {
                    output.text = (" You're Right ")
                }
                else
                {
                    output.text = (" Wrong! it was " + String(num) + ".")
                }
                
            }
            else
            {
                output.text = " Wrong Input "
            }
        }
    else {
        output.text = " Waiting for input "
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

