//
//  DetailRandomUserViewController.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class DetailRandomUserViewController: UIViewController {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    

    func setUpViews() {
        phoneLabel.text = user.phone
        addressLabel.text = user.location.fullAddress()
        dateOfBirthLabel.text = user.dob.date
    }

}
