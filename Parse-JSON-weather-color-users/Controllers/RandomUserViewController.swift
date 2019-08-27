//
//  RandomUserViewController.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    
    @IBOutlet weak var randomUserTableView: UITableView!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomUserTableView.dataSource = self
        randomUserTableView.delegate = self
        loadData()

        // Do any additional setup after loading the view.
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "RandomUsers", ofType: "json") else {
            fatalError("Couldn't find JSON File")
            // episodes = whatever we decode from the JSON file
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let randomUsersFromJSON = try User.getUsers(from: data)
            users = randomUsersFromJSON
        } catch {
            fatalError("Couldn't get episodes from JSON")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RandomUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name.fullyNamed()
        cell.detailTextLabel?.text = users[indexPath.row].email
        return cell
    }
    
    
}

extension RandomUserViewController: UITableViewDelegate {
    
}
