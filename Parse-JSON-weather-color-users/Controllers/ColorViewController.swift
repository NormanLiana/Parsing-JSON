//
//  ColorViewController.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var colorTableView: UITableView!
    
    var colors = [Color]()

    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.dataSource = self
        colorTableView.delegate = self
    }
    
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
    }
    
    
}

extension ColorViewController: UITableViewDelegate {
    
}
