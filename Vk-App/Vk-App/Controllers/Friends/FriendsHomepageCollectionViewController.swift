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
    var friendsSection = [Section<Friend>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsSection = friendsDictionary.map { Section(title: String($0.key), items: $0.value)}
        friendsSection.sort { $0.title < $1.title }
    }

    @IBAction func likeButton(_ sender: Any) {
        (sender as? LikeButton)?.like()
    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsHomepageCollectionViewCell", for: indexPath) as? FriendsHomepageCollectionViewCell else { return UICollectionViewCell() }
        cell.friendsHomepageAvatar.image.image = UIImage(named: friendsSection[selectedFriend.section].items[selectedFriend.row].avatarPath)
        cell.friendsHomepageName.text = friendsSection[selectedFriend.section].items[selectedFriend.row].name
        return cell
    }
}
