//
//  UIViewController+ChildViewController.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func zql_addChildViewController(vc:UIViewController, subViewRect:CGRect, hidden:Bool) {
        self.addChildViewController(vc)
        vc.view.frame = subViewRect
        vc.view.hidden = hidden
        self.view.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        
    }
    
    func zql_deleteChildViewController(vc:UIViewController) {
        vc.willMoveToParentViewController(nil)
        vc.view.removeFromSuperview()
        vc.removeFromParentViewController()
        
    }
}