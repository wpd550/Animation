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
        switch type.rawValue{
        case 0:
            positionAnimation()
        case 1:
            rotationAnimation()
        case 2:
            scaleAnimation()
        case 3:
            opacityAnimation()
        case 4:
            backgroundAnimation()
        default:
            break
        }
        
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
    
    func rotationAnimation(){
        let animation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        animation.toValue = NSNumber.init(value:Double.pi)
        animation.duration = 0.1
        animation.repeatDuration = 1e100
        view_Body.layer.add(animation, forKey: "rotateAnimation")
    }
    
    //缩放动画
    func scaleAnimation() {
        
        let animation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.toValue = NSNumber.init(value: 2.0)
        animation.duration = 5.0
        view_Body.layer.add(animation, forKey: "scaleAnimation")
    }
    
    //透明度
    func opacityAnimation(){
        let animation = CABasicAnimation.init(keyPath: "opacity")
        animation.fromValue = NSNumber.init(value: 1.0)
        animation.toValue = NSNumber.init(value: 0.0)
        animation.duration = 1.0
        view_Body.layer.add(animation, forKey: "opacityAnimation")
    }
    
    //背景颜色
    func backgroundAnimation(){
        let animation = CABasicAnimation.init(keyPath: "backgroundColor")
        animation.toValue = UIColor.green.cgColor //因为layer层动画, 所以需要使用cgColor
        animation.duration = 1.0
        view_Body.layer.add(animation, forKey: "backgroundColorAnimation")
    }
}

