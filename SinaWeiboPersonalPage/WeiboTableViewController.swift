//
//  WeiboTableViewController.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class WeiboTableViewController: UITableViewController {
    
    var delegate :TableViewMoveProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
         self.tableView.registerNib(UINib(nibName: "NormalWeiboTableViewCell", bundle: nil), forCellReuseIdentifier:NormalWeiboTableViewCell.reuseIdentifier)
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.contentInset = UIEdgeInsetsMake(kHeaderViewHeight - 64, 0, 0, 0)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        delegate?.TableViewMove(scrollView.contentOffset.y)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NormalWeiboTableViewCell.reuseIdentifier) as! NormalWeiboTableViewCell
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
}

