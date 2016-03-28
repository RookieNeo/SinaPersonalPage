//
//  SwitchView.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

private let kIndex1 = 1
private let kIndex2 = 2
private let kIndex3 = 3

typealias callback = (index:Int) -> ()

class SwitchView: UIView {
    
    let button1 = UIButton(type: .Custom)
    let button2 = UIButton(type: .Custom)
    let button3 = UIButton(type: .Custom)
    
    var afterClickAction:callback?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
        button1.setTitle("主页", forState: .Normal)
        button1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        button2.setTitle("微博", forState: .Normal)
        button2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        button3.setTitle("相册", forState: .Normal)
        button3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        button1.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        button2.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        button3.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        button1.center = CGPoint(x: kScreenWidth/4, y: 22)
        button2.center = CGPoint(x: kScreenWidth/2, y: 22)
        button3.center = CGPoint(x: kScreenWidth/4*3, y: 22)
        
        button1.tag = kIndex1
        button2.tag = kIndex2
        button3.tag = kIndex3
        
        button1.addTarget(self, action: Selector("handleSwitchButtonClick:"), forControlEvents: .TouchUpInside)
        button2.addTarget(self, action: Selector("handleSwitchButtonClick:"), forControlEvents: .TouchUpInside)
        button3.addTarget(self, action: Selector("handleSwitchButtonClick:"), forControlEvents: .TouchUpInside)
        
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        
    }
    
    func handleSwitchButtonClick(sender:UIButton) {
        if let handler = afterClickAction {
            handler(index: sender.tag)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
