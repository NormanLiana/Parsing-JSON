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
        loadData()
        print(colors)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetailColor" {
            guard let detailColorVC = segue.destination as? DetailColorViewController else {
                fatalError()
            }
            guard let selectedIndexPath = colorTableView.indexPathForSelectedRow else {
                fatalError()
            }
            detailColorVC.color = colors[selectedIndexPath.row]
        }
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "Color", ofType: "json") else {
            fatalError("Couldn't find JSON File")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let colorsFromJSON = try Color.getColors(from: data)
            colors = colorsFromJSON
        } catch {
            print(error)
        }
    }
    
    
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let color = colors[indexPath.row]
        cell.textLabel?.text = color.name.value
        cell.backgroundColor = UIColor(red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g), blue: CGFloat(color.rgb.fraction.b), alpha: 1.0)
        return cell
    }
    
    
}

extension ColorViewController: UITableViewDelegate {
    
}
