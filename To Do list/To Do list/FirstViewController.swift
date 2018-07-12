//
//  FirstViewController.swift
//  To Do list
//
//  Created by Kevin Naik on 12/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if UserDefaults.standard.object(forKey: "Number") != nil
        {
            let y = UserDefaults.standard.object(forKey: "Number")
            let z = y as! Int
           // let z = Int(zz)
            print(z)
            return z + 1
        }
        else
        {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            UserDefaults.standard.removeObject(forKey: String(indexPath.row))
            let count: Int = UserDefaults.standard.object(forKey: "Number") as! Int
            var current = indexPath.row
            while current <= count
            {
                print(UserDefaults.standard.set(UserDefaults.standard.object(forKey: String(current + 1)), forKey:String(current)))
                print(current += 1)
            }
            UserDefaults.standard.set(count - 1,forKey: "Number")
            table.reloadData()
            
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "table")
        cell.textLabel?.text = UserDefaults.standard.object(forKey: String(indexPath.row)) as? String
        print (cell)
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        // super.viewWillAppear(true)
               table.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
           }


}

