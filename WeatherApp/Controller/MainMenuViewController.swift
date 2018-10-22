//
//  MainMenuViewController.swift
//  WeatherApp
//
//  Created by Екатерина on 01.07.2018.
//  Copyright © 2018 Екатерина. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var chhoseCityBT: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        welcomeLabel.alpha = 0
        chhoseCityBT.alpha = 0
        UILabel.animate(withDuration: 1, delay: 0.3, options: [], animations: {[weak self] in
           self?.welcomeLabel.alpha = 1
        }, completion:nil)
        UIButton.animate(withDuration: 0.55, delay: 0.8, options: [], animations: {[weak self] in
            self?.chhoseCityBT.alpha = 1
        }, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
