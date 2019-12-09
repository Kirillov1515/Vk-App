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
    
    // MARK: - Delete rows function
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listOfMyGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Add Group segue
    
    @IBAction func addGroup(unwindsegue: UIStoryboardSegue) {
        guard let AllGroupsTableViewController = unwindsegue.source as? AllGroupsTableViewController else { return }
        guard let indexPath = AllGroupsTableViewController.tableView.indexPathForSelectedRow else { return }
        let selectedGroup = listOfAllGroups[indexPath.row]
        listOfMyGroups.append(selectedGroup)
        tableView.reloadData()
    }
}
