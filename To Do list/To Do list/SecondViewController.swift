//
//  SecondViewController.swift
//  To Do list
//
//  Created by Kevin Naik on 12/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var additem: UITextField!
    
    @IBAction func itemadded(_ sender: Any) {
        if additem.hasText
        {
            if (UserDefaults.standard.object(forKey: "Number") != nil)
            {
                let yy = UserDefaults.standard.object(forKey: "Number")
                var x = yy as! Int
                //var x = Int(zzz)!
                x = x + 1
                print (x)
                UserDefaults.standard.set(additem.text, forKey: String(x))
                UserDefaults.standard.set(x, forKey: "Number")
            }
            else
            {
                UserDefaults.standard.set(0, forKey: "Number")
                let xx = UserDefaults.standard.object(forKey: "Number") as! Int
                UserDefaults.standard.set(additem.text, forKey: String(xx))
                print(additem.text as Any)
                print(xx)
            }
        }
        self.additem.text = nil
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ additem: UITextField) -> Bool {
        additem.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

}

