//
//  ViewController.swift
//  EcornAnimationDemo
//
//  Created by littlecute on 2021/9/25.
//

import UIKit

class ViewController: UIViewController {

    
    fileprivate var tableView:UITableView!
    fileprivate var array = [Dictionary<String,Any>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        initMainView()
        title = "Animation"
        
        configData()
        initMainView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension ViewController{
    // MARK: 配置数据
    func configData() {
        
        var dict_SectionOne = Dictionary<String, Any>()
        dict_SectionOne["title"] = "基础动画"
        dict_SectionOne["rowValue"] = ["位移", "旋转", "缩放", "透明度", "背景色"]
        
        var dict_SectionTwo = Dictionary<String, Any>()
        dict_SectionTwo["title"] = "关键帧动画"
        dict_SectionTwo["rowValue"] = ["关键帧", "路径", "抖动"]
        
        var dict_SectionThree = Dictionary<String, Any>()
        dict_SectionThree["title"] = "组动画"
        dict_SectionThree["rowValue"] = ["同时", "连续"]
        
        var dict_SectionFour = Dictionary<String, Any>()
        dict_SectionFour["title"] = "过渡动画"
        dict_SectionFour["rowValue"] = ["fade", "moveln", "push", "reveal", "cube", "suck", "oglFile", "ripple", "curl", "unCurl", "caOpen", "caClose"]
        
        var dict_SectionFive = Dictionary<String, Any>()
        dict_SectionFive["title"] = "项目案例"
        dict_SectionFive["rowValue"] = ["弹球", "钉钉", "点赞", "贝塞尔曲线", "进度"]
        
        array = [dict_SectionOne, dict_SectionTwo, dict_SectionThree, dict_SectionFour, dict_SectionFive]
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array: Array = array[section]["rowValue"] as? Array<String>{
            return array.count
        }
        return 0
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "AnimationCellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil{
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        if let array: Array = array[indexPath.section]["rowValue"] as? Array<String>{
            cell?.textLabel?.text = array[indexPath.row]
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return array[section]["title"] as? String
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select index %@",indexPath)
        var vc:BaseViewController!
        switch(indexPath.section){
        case 0:
            vc = BaseAnimationViewController.init(enterType: indexPath.row)
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            vc = KeyAnimationController.init(enterType: indexPath.row)
        default:
            break
        }
        guard let vc = vc else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



extension ViewController{
    func initMainView(){
        tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.init(red: 180, green: 180, blue: 180, alpha: 1)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(kNavigationBarHei)
            make.left.right.equalTo(view)
            make.bottom.equalTo(-iPhoneXBottemHei)
        }
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.sectionFooterHeight = 0;
        tableView.sectionHeaderHeight = 30;
    }
    
}

