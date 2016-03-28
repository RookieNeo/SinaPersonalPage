//
//  PersonPageViewController.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class PersonPageViewController: UIViewController {
    let firstVC = PersonalTableViewController()
    let switchView = SwitchView(frame: CGRect(x: 0, y: 10, width: kScreenWidth, height: 44))
    
    let secondVC = WeiboTableViewController()
    var currentIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        let subViewRect = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        firstVC.firstSectionHeader = switchView
        self.zql_addChildViewController(secondVC, subViewRect: subViewRect, hidden: false)
        
        self.zql_addChildViewController(firstVC, subViewRect:subViewRect, hidden: false)
        
                self.view.addSubview(switchView)
        
        switchView.afterClickAction = { [unowned self](index:Int) -> Void in
            
            if index == 1 {
                self.secondVC.firstSectionHeader = nil
                self.firstVC.firstSectionHeader = self.switchView
                self.firstVC.tableView.reloadData()
                self.view.bringSubviewToFront(self.firstVC.view)
            }
            
            if index == 2 {
               
                self.firstVC.firstSectionHeader = nil
                self.secondVC.firstSectionHeader = self.switchView
                self.secondVC.tableView.reloadData()
                self.view.bringSubviewToFront(self.secondVC.view)
                
            }
    
            
        }// Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
