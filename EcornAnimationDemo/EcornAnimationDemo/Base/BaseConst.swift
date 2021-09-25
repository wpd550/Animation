//
//  BaseConst.swift
//  EcornAnimationDemo
//
//  Created by littlecute on 2021/9/25.
//


import UIKit

let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height
let kScreenBounds = UIScreen.main.bounds

let iPhoneXBottemHei:CGFloat = UIDevice.current.isX() == true ? 34.0 : 0
let kNavigationBarHei:CGFloat = 64.0 + (UIDevice.current.isX() == true ? 24.0 : 0)
let kBottomBarHei:CGFloat = 49.0 + iPhoneXBottemHei

extension UIDevice{
    public func isX()->Bool{
        return UIScreen.main.bounds.height == 812;
    }
}
