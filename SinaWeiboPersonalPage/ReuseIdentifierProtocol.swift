//
//  ReuseIdentifierProtocol.swift
//  SinaWeiboPersonalPage
//
//  Created by 臧其龙 on 16/3/28.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import Foundation
import UIKit

public protocol ReuseIdentifierProtocol: class {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol {
    static var reuseIdentifier : String {
        return String(Self)
    }
}

public extension UICollectionView {
    func registerClass<T : UICollectionViewCell where T : ReuseIdentifierProtocol>(cellClass : T.Type) {
        self.registerClass(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}

public extension UITableView {
    func registerClass<T : UITableViewCell where T : ReuseIdentifierProtocol>(cellClass : T.Type) {
        self.registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        
    }
}