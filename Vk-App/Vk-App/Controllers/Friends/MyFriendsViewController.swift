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
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsSection = friendsDictionary.map { Section(title: String($0.key), items: $0.value)}
        friendsSection.sort { $0.title < $1.title }
        
        searchBar.delegate = self
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsSection[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsTableViewCell", for: indexPath) as? MyFriendsTableViewCell else { return UITableViewCell() }
        cell.myFriendsAvatar.image = UIImage(named: friendsSection[indexPath.section].items[indexPath.row].avatarPath)
        cell.myFriendsName.text = friendsSection[indexPath.section].items[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSection[section].title
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSection.map { $0.title }
    }
}

extension MyFriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let friendsDictionary = Dictionary.init(grouping: listOfMyFriends.filter { (friend) -> Bool in
            return searchText.isEmpty ? true : friend.name.lowercased().contains(searchText.lowercased())
        }) { $0.name.prefix(1) }
        friendsSection = friendsDictionary.map { Section(title: String($0.key), items: $0.value)}
        friendsSection.sort { $0.title < $1.title }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
