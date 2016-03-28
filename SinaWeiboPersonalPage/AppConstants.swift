//
//  AppConstants.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import Foundation
import UIKit

public let kScreenWidth = UIScreen.mainScreen().bounds.size.width
public let kScreenHeight = UIScreen.mainScreen().bounds.size.height

public let kHeaderViewHeight:CGFloat = 237
public let kCellHeight:CGFloat = 100

public typealias scrollCallback = (headerFrame:CGRect) -> ()