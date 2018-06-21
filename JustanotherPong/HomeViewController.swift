//
//  HomeViewController.swift
//  JustanotherPong
//
//  Created by Giovanni  Filippini on 15/06/18.
//  Copyright © 2018 Giovanni Filippini. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var appVersionLabel: UILabel!
    @IBAction func play(_ sender: Any) {
        
//        moveToGame()
        
    }
    
//    func moveToGame(){
//        
//        let moveToGame = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
//        self.navigationController?.pushViewController(moveToGame, animated: true)
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appVersionLabel.text = ("V \(appVersion)")
        
    }
    
    var appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]! as! String
    
}
