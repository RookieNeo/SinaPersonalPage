//
//  PersonPageViewController.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class PersonPageViewController: UIViewController,UIScrollViewDelegate,TableViewMoveProtocol {
    
    let firstVC = PersonalTableViewController()
    let switchView = SwitchView(frame: CGRect(x: 0, y: kHeaderViewHeight - 44, width: kScreenWidth, height: 44))
    let secondVC = WeiboTableViewController()
    let scrollView = UIScrollView()
    let subScrollView = UIScrollView()
    var headView :  HeadView!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.subviews[0].alpha = 0
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(switchView)
        configUI()
    }// Do any additional setup after loading the view.
    func configUI(){
        switchView.afterClickAction =  { [unowned self](index:Int) -> Void in
            
           self.subScrollView.contentOffset = CGPointMake(kScreenWidth * CGFloat(index - 1), 0)
            }
        scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight)
        scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight + kHeaderViewHeight)
        scrollView.delegate = self
        scrollView.scrollEnabled = false
        self.view.addSubview(scrollView)
        headView = NSBundle.mainBundle().loadNibNamed("HeadView", owner: self, options: nil).last as! HeadView
        headView.frame = CGRectMake(0, 0, kScreenWidth, kHeaderViewHeight)
        scrollView.addSubview(headView)
        
        subScrollView.frame = CGRectMake(0, kHeaderViewHeight, kScreenWidth, kScreenHeight)
        subScrollView.contentSize = CGSizeMake(kScreenWidth * 4, 0)
        subScrollView.pagingEnabled = true
        scrollView.addSubview(subScrollView)
        
        firstVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight )
        firstVC.delegate = self
        subScrollView.addSubview(firstVC.view)
        self.navigationController?.addChildViewController(firstVC)
        
        secondVC.view.frame = CGRectMake(kScreenWidth,0, kScreenWidth, kScreenHeight)
        secondVC.delegate = self
        subScrollView.addSubview(secondVC.view)
        self.navigationController?.addChildViewController(secondVC)
        self.view.addSubview(switchView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func TableViewMove(y:CGFloat){
        print(y)
        if y <= 0{
            headView.frame.size.height = kHeaderViewHeight - y
            switchView.frame.origin.y = kHeaderViewHeight - 44 - y
            scrollView.contentOffset = CGPointMake(0, 0)
            self.navigationController?.navigationBar.subviews[0].alpha = 0
        }else if y>0 && y <= kHeaderViewHeight{
            scrollView.contentOffset = CGPointMake(0, y)
            self.navigationController?.navigationBar.subviews[0].alpha = y / kHeaderViewHeight
            if y <= kHeaderViewHeight - 44 - 64{
                switchView.frame.origin.y = kHeaderViewHeight - 44 - y
            }else{
                switchView.frame.origin.y = 64
            }
        }else if y > kHeaderViewHeight{
            scrollView.contentOffset = CGPointMake(0, kHeaderViewHeight)
            switchView.frame.origin.y = 64
            self.navigationController?.navigationBar.subviews[0].alpha = 1
        }
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
