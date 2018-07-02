//
//  ViewController.swift
//  Is it Prime
//
//  Created by Kevin Naik on 02/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    var isprime = true
    @IBAction func buttonclicked(_ sender: Any) {
        if input.hasText{
            
            if Int(input.text!) != nil
            {
                if (Int(input.text!) == 1) || (Int(input.text!) == 2) {
                    isprime = true
                }
                else
                {
                output.text = " Checking... "
                var i = 2
                
                while i < Int(input.text!)!{
                            if Int(input.text!)! % i == 0{
                            isprime = false
                            break
                                }
                            else
                            {
                                isprime = true
                            }
                            i += 1
                        }
                }
                if isprime
                {
                    output.text = " Number is prime "
                }
                else
                {
                    output.text = " Number is Non-prime "
                }
               }
          else
           {
            output.text = " Wrong Entry "
            }
        }
        else{
            output.text = " No entry "
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

