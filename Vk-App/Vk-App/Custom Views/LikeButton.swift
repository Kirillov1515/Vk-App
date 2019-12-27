//
//  LikeButton.swift
//  Vk-App
//
//  Created by Macbook on 26/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    var isLiked: Bool = false
    var numberOfLikes: Int = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDefault()
    }
    
    func like() {
        isLiked = !isLiked
        
        if isLiked {
            setLike()
        } else {
            removeLike()
        }
    }
    
    func setupDefault() {
        setImage(UIImage(named: isLiked ? "like" : "dislike"), for: .normal)
        setTitle(String(describing: numberOfLikes), for: .normal)
        tintColor = isLiked ? .red : .gray
        
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func setLike() {
        numberOfLikes += 1
        setImage(UIImage(named: "like"), for: .normal)
        setTitle(String(describing: numberOfLikes), for: .normal)
        tintColor = .red
    }
    
    func removeLike() {
        numberOfLikes -= 1
        setImage(UIImage(named: "dislike"), for: .normal)
        setTitle(String(describing: numberOfLikes), for: .normal)
        tintColor = .gray
    }
}
