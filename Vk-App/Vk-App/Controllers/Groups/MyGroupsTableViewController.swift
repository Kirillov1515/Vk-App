//
//  MyGroupsTableViewController.swift
//  Vk-App
//
//  Created by Macbook on 06/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

    var listOfGroups = ["qwerty", "asdfg", "zxcvbnm", "12345678"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsTableViewCell", for: indexPath) as! MyGroupsTableViewCell
        cell.myGroupsName.text = listOfGroups[indexPath.row]
        return cell
    }

}
