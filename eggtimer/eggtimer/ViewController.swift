//
//  ViewController.swift
//  eggtimer
//
//  Created by Kevin Naik on 08/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var output: UILabel!
    var timer = Timer()
    var time = 210
    // output.text = String(time)
    @objc func decreasetimer()
    {
        if (time > 0 )
        {
            time -= 1
            output.text = String(time)
        }
        else
        {
            timer.invalidate()
            output.text = String(time)
        }
    }
    @IBAction func play(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreasetimer), userInfo: nil, repeats: true)
    }
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        output.text = String(time)
    }
    
    @IBAction func reset(_ sender: Any) {
        time = 210
        output.text = String(time)
    }
    
    @IBAction func positive(_ sender: Any) {
        time += 10
        output.text = String(time)
    }
    
    @IBAction func negative(_ sender: Any) {
        if time > 10
        {
            time -= 10
            output.text = String(time)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

