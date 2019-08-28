//
//  DetailColorViewController.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class DetailColorViewController: UIViewController {
    
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    
    
    var color: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        hexLabel.text = color.hex.value
        redLabel.text = "Red: \(color.rgb.fraction.r), Green: \(color.rgb.fraction.g), Blue: \(color.rgb.fraction.b)"
    }

}
