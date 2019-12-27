//
//  ListOfMyFriends.swift
//  Vk-App
//
//  Created by Macbook on 10/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import Foundation

var listOfMyFriends = [Friend(avatarPath: "friend1", name: "Abcd"),
                       Friend(avatarPath: "friend2", name: "Sasha"),
                       Friend(avatarPath: "friend3", name: "Tanya"),
                       Friend(avatarPath: "friend4", name: "Qwerty"),
                       Friend(avatarPath: "friend5", name: "Adkr"),
                       Friend(avatarPath: "friend6", name: "Tanya"),
                       Friend(avatarPath: "friend7", name: "Qwerty"),
                       Friend(avatarPath: "friend3", name: "Sasha"),
                       Friend(avatarPath: "friend1", name: "Tanya"),
                       Friend(avatarPath: "friend0", name: "Qwerty"),
                       Friend(avatarPath: "friend2", name: "Btyu"),
                       Friend(avatarPath: "friend3", name: "Tanya"),
                       Friend(avatarPath: "friend4", name: "Qwerty"),
                       Friend(avatarPath: "friend5", name: "Sasha"),
                       Friend(avatarPath: "friend6", name: "Tanya"),
                       Friend(avatarPath: "friend7", name: "Frtio"),
                       Friend(avatarPath: "friend3", name: "Sasha"),
                       Friend(avatarPath: "friend0", name: "Tanya"),
                       Friend(avatarPath: "friend1", name: "Qwerty"),
                       Friend(avatarPath: "friend2", name: "Sasha"),
                       Friend(avatarPath: "friend3", name: "Tanya")
]

var friendsSection = [Section<Friend>]()

let friendsDictionary = Dictionary.init(grouping: listOfMyFriends) { $0.name.prefix(1) }

//func makeFriendsSection () {
//    friendsSection = friendsDictionary.map { Section(title: String($0.key), items: $0.value)}
//    friendsSection.sort { $0.title < $1.title }
//}

//friendsSection = friendsDictionary.map { Section(title: String($0.key), items: $0.value)}
//friendsSection.sort { $0.title < $1.title }
