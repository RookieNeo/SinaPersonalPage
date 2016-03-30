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
    var currentIndex : CGFloat = -173
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
//        scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight)
//        scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight + kHeaderViewHeight)
//        scrollView.delegate = self
//        scrollView.scrollEnabled = false
//        self.view.addSubview(scrollView)
        
        subScrollView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64)
        subScrollView.contentSize = CGSizeMake(kScreenWidth * 4, 0)
        subScrollView.pagingEnabled = true
        subScrollView.delegate = self
        self.view.addSubview(subScrollView)
        
        firstVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)
        firstVC.delegate = self
        subScrollView.addSubview(firstVC.view)
        self.navigationController?.addChildViewController(firstVC)
        
        secondVC.view.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight - 64)
        secondVC.delegate = self
        subScrollView.addSubview(secondVC.view)
        self.navigationController?.addChildViewController(secondVC)
        
        headView = NSBundle.mainBundle().loadNibNamed("HeadView", owner: self, options: nil).last as! HeadView
        headView.frame = CGRectMake(0, 0, kScreenWidth, kHeaderViewHeight)
        self.view.addSubview(headView)
        
        self.view.addSubview(switchView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let tableViewArray  = [firstVC.tableView,secondVC.tableView]
        let index = Int(scrollView.contentOffset.x / kScreenWidth)
       // tableViewArray[index].contentOffset.y = currentIndex
        switch index{
        case 0 :
             tableViewArray[0].contentOffset.y = currentIndex
            tableViewArray[1].contentOffset.y = currentIndex
        case 1 :
             tableViewArray[0].contentOffset.y = currentIndex
             tableViewArray[0].contentOffset.y = currentIndex
        default :
            break
        }
    }
    func TableViewMove(y:CGFloat){
        print(y)
        if y <= -173{
            currentIndex = -173
            headView.frame.size.height = kHeaderViewHeight - (173 + y)
            switchView.frame.origin.y = kHeaderViewHeight - (173 + 44 + y)
            self.navigationController?.navigationBar.subviews[0].alpha = 0
        }else if y > -173 && y <= 0{
            currentIndex = y
            headView.frame.origin.y = -kHeaderViewHeight - y + 64
            self.navigationController?.navigationBar.subviews[0].alpha = y / kHeaderViewHeight
            if y <= -43{
                switchView.frame.origin.y = kHeaderViewHeight - 44 - (173 + y)
            }else{
                switchView.frame.origin.y = 64
            }
            
        }else if y > 0{
            currentIndex = 0
            headView.frame.origin.y = -kHeaderViewHeight + 64
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
