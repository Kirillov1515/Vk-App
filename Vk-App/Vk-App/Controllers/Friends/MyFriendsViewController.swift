//
//  MyFriendsViewController.swift
//  Vk-App
//
//  Created by Macbook on 06/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class MyFriendsViewController: UIViewController {
    
    let arrayFriends = ["Sasha", "Tanya", "qwerty"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension MyFriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsTableViewCell", for: indexPath) as! MyFreindsTableViewCell
        cell.myFriendsName?.text = arrayFriends[indexPath.row]
        return cell
    }
    
    
}

extension MyFriendsViewController: UITableViewDelegate {
    
}
