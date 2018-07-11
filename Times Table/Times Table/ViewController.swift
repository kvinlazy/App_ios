//
//  ViewController.swift
//  Times Table
//
//  Created by Kevin Naik on 11/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var timetable: UITableView!
    @IBAction func sliderclicked(_ sender: Any) {
        print(slider.value)
        timetable.reloadData()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 50
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "table")
       let y = Int(slider.value)
       let z = Int(indexPath.row + 1)
       let x = y * z
       
        cell.textLabel?.text = "\(y) * \(z)  = \(x)"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

