//
//  FriendsHomepageCollectionViewController.swift
//  Vk-App
//
//  Created by Macbook on 11/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class FriendsHomepageCollectionViewController: UICollectionViewController {

    var selectedFriend: IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsHomepageCollectionViewCell", for: indexPath) as? FriendsHomepageCollectionViewCell else { return UICollectionViewCell() }
        cell.friendsHomepageAvatar.image.image = UIImage(named: listOfMyFriends[selectedFriend.row].avatarPath)
        cell.friendsHomepageName.text = listOfMyFriends[selectedFriend.row].name
        return cell
    }
}
