//
//  MyFriendsViewController.swift
//  Vk-App
//
//  Created by Macbook on 11/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class MyFriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectFriendSegue" {
            if let indexPath = tableView.indexPathForSelectedRow, let friendsHomepageCollectionViewController = segue.destination as? FriendsHomepageCollectionViewController {
                friendsHomepageCollectionViewController.selectedFriend = indexPath
            }
        }
    }
}

extension MyFriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfMyFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsTableViewCell", for: indexPath) as? MyFriendsTableViewCell else {return UITableViewCell()}
        cell.myFriendsAvatar.image = UIImage(named: listOfMyFriends[indexPath.row].avatarPath)
        cell.myFriendsName.text = listOfMyFriends[indexPath.row].name
        return cell
    }
}
