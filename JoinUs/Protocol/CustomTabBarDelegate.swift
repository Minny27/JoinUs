//
//  CustomTabBarDelegate.swift
//  JoinUs
//
//  Created by SeungMin on 2022/02/27.
//

import UIKit

protocol CustomTabBarDelegate: AnyObject {
    func customTabBarIndex(scroll index: Int)
    func pastScrollOffsetX(offsetX pastScrollOffsetX: CGFloat)
}
