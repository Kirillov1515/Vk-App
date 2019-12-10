//
//  MyFriendsViewController.swift
//  Vk-App
//
//  Created by Macbook on 06/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class MyFriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyFreindsTableViewCell.self, forCellReuseIdentifier: "MyFreindsTableViewCell")
    }

}

extension MyFriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMyFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFreindsTableViewCell", for: indexPath) as! MyFreindsTableViewCell
        cell.myFriendsAvatar.image = UIImage(named: listOfMyFriends[indexPath.row].name)
        cell.myFriendsName.text = listOfMyFriends[indexPath.row].name
        return cell
    }
    
    
}

extension MyFriendsViewController: UITableViewDelegate {
    
}
