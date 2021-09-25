//
//  BaseAnimationViewController.swift
//  EcornAnimationDemo
//
//  Created by littlecute on 2021/9/25.
//

import Foundation
import UIKit

enum BaseAnimationType:Int {
    case position = 0 //位移
    case rotate = 1 //旋转
    case scale //缩放
    case opacity //透明度
    case backgroundColor //背景色

}

class BaseAnimationViewController: BaseViewController{
    
    fileprivate var type:BaseAnimationType = .position
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(enterType: Int) {
        self.init()
        switch enterType {
        case 0:
            type = .position
        case 1:
            type = .rotate
        case 2:
            type = .scale
        case 3:
            type = .opacity
        case 4:
            type = .backgroundColor
        default:
            break
        }
    }
}


extension BaseAnimationViewController{
    override func playBtnClick(btn: UIButton) {
        positionAnimation()
    }
}

extension BaseAnimationViewController{
    func positionAnimation() {
        let animation = CABasicAnimation.init(keyPath: "position") //keyPath为系统提供
        animation.fromValue = CGPoint.init(x: margin_ViewMidPosition, y: kScreenH / 2 - margin_Top)
        animation.toValue = CGPoint.init(x: kScreenW - margin_ViewMidPosition, y: kScreenH / 2 - margin_Top)
        animation.duration = 1.0
        view_Body.layer.add(animation, forKey: "positionAnimation") //key自定义
    }
}

