//
//  HeaderView.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    let avatarImageView = UIImageView(image: UIImage(named: "wuyanzu.jpg")!)

    override init(frame: CGRect) {
        super.init(frame: frame)
        avatarImageView.frame = self.bounds
        self.addSubview(avatarImageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
