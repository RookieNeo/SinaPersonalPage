//
//  WeiboTableViewController.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class WeiboTableViewController: UITableViewController {

    let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeaderViewHeight))
    var firstSectionHeader:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableHeaderView = headerView
        self.tableView.registerNib(UINib(nibName: "NormalWeiboTableViewCell", bundle: nil), forCellReuseIdentifier:NormalWeiboTableViewCell.reuseIdentifier)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(NormalWeiboTableViewCell.reuseIdentifier) as! NormalWeiboTableViewCell
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return firstSectionHeader
    }

}
