//
//  MyGroupsTableViewController.swift
//  Vk-App
//
//  Created by Macbook on 06/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - TableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMyGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsTableViewCell", for: indexPath) as! MyGroupsTableViewCell
        cell.myGroupsAvatar.image = UIImage(named: listOfMyGroups[indexPath.row].avatarPath)
        cell.myGroupsName.text = listOfMyGroups[indexPath.row].name
        return cell
    }
}
