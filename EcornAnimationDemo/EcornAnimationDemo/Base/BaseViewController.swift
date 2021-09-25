//
//  BaseViewController.swift
//  EcornAnimationDemo
//
//  Created by littlecute on 2021/9/25.
//

import Foundation
import UIKit
import SnapKit

class BaseViewController:UIViewController{
    
    var view_Body: UIView!
    var btn_Play: UIButton!
    
    let margin_Top: CGFloat = 100.0 //位置上移
    let margin_ViewWidthHeight: CGFloat = 100.0 //view宽高
    let margin_ViewMidPosition: CGFloat = 50.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMainView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension BaseViewController{
    
    @objc func playBtnClick(btn:UIButton){
        
    }
}


extension BaseViewController{
    func initMainView(){
        view.backgroundColor = UIColor.white
        view_Body = UIView()
        
        view_Body.backgroundColor = UIColor.red
        view.addSubview(view_Body)
        view_Body.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-margin_Top)
            make.width.height.equalTo(margin_ViewWidthHeight)
        }
        
        btn_Play = UIButton.init(type: .custom)
        btn_Play.setTitle("开始", for: .normal)
        btn_Play.setTitleColor(UIColor.white, for: .normal)
        btn_Play.backgroundColor = UIColor.orange
        btn_Play.addTarget(self, action:#selector(playBtnClick(btn:)), for: .touchUpInside)
        view.addSubview(btn_Play)
        btn_Play.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(-iPhoneXBottemHei - 80)
            make.width.equalTo(150)
            make.height.equalTo(44)
        }
//
    }
}
