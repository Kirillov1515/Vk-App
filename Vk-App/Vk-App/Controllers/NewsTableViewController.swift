//
//  NewsTableViewController.swift
//  Vk-App
//
//  Created by Macbook on 27/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - TableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        cell.avatarPath.image = UIImage(named: listOfNews[indexPath.row].avatarPath)
        cell.groupName.text = listOfNews[indexPath.row].groupName
        cell.time.text = listOfNews[indexPath.row].time
        cell.newsText.text = listOfNews[indexPath.row].text
        cell.newsImage.image = UIImage(named: listOfNews[indexPath.row].image)
        return cell 
    }
}
