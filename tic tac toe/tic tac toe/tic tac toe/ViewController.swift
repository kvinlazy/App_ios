//
//  ViewController.swift
//  tic tac toe
//
//  Created by Kevin Naik on 14/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var output: UILabel!
    
    @IBAction func reset(_ sender: Any) {
        gamestate = [0,0,0,0,0,0,0,0,0]
        activegame = true
        player = 1
        output.text = ""
        for var i in 1..<10
        {
            let button = view.viewWithTag(i) as? UIButton
            button?.setImage(nil, for: [])
            i += 1
        }
    }
    var activegame = true
    var player = 1
    var gamestate = [0,0,0,0,0,0,0,0,0]
    var winner = [[0,1,2],[0,3,6],[3,4,5],[2,5,8],[6,7,8],[0,4,8],[2,4,6],[1,4,7]]
    @IBAction func buttonclicked(_ sender: Any) {
        
        print((sender as AnyObject).tag!)
        
        if gamestate[(sender as AnyObject).tag! - 1] == 0 && activegame
        {
            if player == 1
            {
                gamestate[(sender as AnyObject).tag! - 1] = player
                (sender as AnyObject).setImage(UIImage (named: "zero.png"), for: [])
                player = 2
            }
            else
            {
                gamestate[(sender as AnyObject).tag! - 1] = player
                (sender as AnyObject).setImage(UIImage (named: "cross.jpeg"), for: [])
                player = 1
            }
        }
        for var check in winner
        {
            if gamestate[check[0]] != 0 && gamestate[check[0]] == gamestate[check[1]] && gamestate[check[1]] == gamestate[check[2]]
            {
                activegame = false
                output.text = " The winner is player \(gamestate[check[0]])"
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

