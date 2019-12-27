//
//  AllGroupsTableViewController.swift
//  Vk-App
//
//  Created by Macbook on 06/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - TableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfAllGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableViewCell", for: indexPath) as? AllGroupsTableViewCell else { return UITableViewCell() }
        cell.allGroupsAvatar.image = UIImage(named: listOfAllGroups[indexPath.row].avatarPath)
        cell.allGroupsName.text = listOfAllGroups[indexPath.row].name
        return cell
    }
}
