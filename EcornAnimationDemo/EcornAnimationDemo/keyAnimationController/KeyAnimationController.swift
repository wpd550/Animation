//
//  KeyAnimationController.swift
//  EcornAnimationDemo
//
//  Created by dong on 2021/9/26.
//

import UIKit


enum KeyFrameAnimationType: Int {
    case keyFrame = 0 //关键帧
    case path //路径
    case shake //抖动
}

class KeyAnimationController: BaseViewController {

    fileprivate var type:KeyFrameAnimationType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func removeFromParent() {
        super.removeFromParent()
    }
    

    convenience init(enterType:Int) {
        self.init()
        switch enterType {
        case 0:
            type = .keyFrame
        case 1:
            type = .path
        case 2:
            type = .shake
        default:
            break
        }
    }
}

extension KeyAnimationController{
    override func playBtnClick(btn: UIButton) {
        switch type.rawValue {
        case 0:
            keyFrameAnimation()
        case 1:
            pathAnimation()
        case 2:
            shakeAnimation()
        default:
            break
        }
    }
}

extension KeyAnimationController{
    func keyFrameAnimation(){
        
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        let value_0 = CGPoint.init(x: margin_ViewMidPosition, y: kScreenH / 2 - margin_ViewWidthHeight)
        let value_1 = CGPoint.init(x: kScreenW / 3, y: kScreenH / 2 - margin_ViewWidthHeight)
        let value_2 = CGPoint.init(x: kScreenW / 3, y: kScreenH / 2 + margin_ViewMidPosition)
        let value_3 = CGPoint.init(x: kScreenW * 2 / 3, y: kScreenH / 2 + margin_ViewMidPosition)
        let value_4 = CGPoint.init(x: kScreenW * 2 / 3, y: kScreenH / 2 - margin_ViewWidthHeight)
        let value_5 = CGPoint.init(x: kScreenW - margin_ViewMidPosition, y: kScreenH / 2 - margin_ViewWidthHeight)
        animation.values = [value_0, value_1, value_2, value_3, value_4, value_5]
        animation.duration = 2.0
        view_Body.layer.add(animation, forKey: "keyFrameAnimation")
        
    }
    // 只对涂层又有
    func pathAnimation(){
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: kScreenW/2, y: kScreenH/2), radius: 60, startAngle: 0.0, endAngle: .pi * 2, clockwise: true)
        animation.path = path.cgPath
        animation.duration = 2.0
        view_Body.layer.add(animation, forKey: "pathAnimation")
    }
    
    func shakeAnimation(){
        let animation = CAKeyframeAnimation.init(keyPath: "transform.rotation")
        let value_0 = NSNumber.init(value: -Double.pi / 180 * 16)
        let value_1 = NSNumber.init(value: Double.pi / 180 * 16)
        animation.values = [value_0, value_1, value_0]
        animation.duration = 0.1
        animation.repeatCount = 2
        view_Body.layer.add(animation, forKey: "shakeAnimation")
    }
    
    
}
