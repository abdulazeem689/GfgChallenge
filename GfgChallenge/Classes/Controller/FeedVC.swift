//
//  ViewController.swift
//  GfgChallenge
//
//  Created by Flexnest on 25/01/22.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var headerVw: UIView!
    
    var refreshControl: UIRefreshControl!
    var arrFeed = [FeedItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerVw.layer.borderWidth = 0.5
        headerVw.layer.borderColor = UIColor.gray.cgColor
        
        setupTableview()
        getFeedData()
    }
    
    private func setupTableview() {
        //Adding top and bottom spacing to tableview.
        tableview.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        //Register cells.
        tableview.register(UINib(nibName: "FeedTVCell", bundle: nil), forCellReuseIdentifier: "FeedTVCell")
        tableview.register(UINib(nibName: "TopFeedTVCell", bundle: nil), forCellReuseIdentifier: "TopFeedTVCell")
        //Adding pull to refresh.
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        refreshControl.addTarget(self, action: #selector(onPullToRefresh), for: .valueChanged)
        tableview.refreshControl = refreshControl
    }
    
    private func getFeedData() {
        DataManager.getFeedApiData { feedItems in
            self.arrFeed = feedItems
            self.tableview.reloadData()
            if self.refreshControl != nil { self.refreshControl.endRefreshing()
            }
        }
    }
    
    @objc
    private func onPullToRefresh() {
        getFeedData()
    }
}

extension FeedVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopFeedTVCell", for: indexPath) as! TopFeedTVCell
            cell.setupUI(feed: arrFeed[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTVCell", for: indexPath) as! FeedTVCell
            cell.setupUI(feed: arrFeed[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row ==  0 {
            return UIDevice.current.userInterfaceIdiom == .pad ? 600 : 400
        }
        return UIDevice.current.userInterfaceIdiom == .pad ? 210 : 140
    }
    
}

