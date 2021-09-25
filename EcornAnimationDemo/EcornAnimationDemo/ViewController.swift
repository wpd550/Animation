//
//  ViewController.swift
//  EcornAnimationDemo
//
//  Created by littlecute on 2021/9/25.
//

import UIKit

class ViewController: UIViewController {

    var view_Body: BaseAnimationViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initMainView()
    }


}

extension ViewController{
    func initMainView(){
        view_Body =  BaseAnimationViewController()
        view.addSubview(view_Body.view)
        view_Body.view.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
}

