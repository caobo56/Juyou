//
//  HomeDetailViewController.swift
//  JuYou
//
//  Created by caobo56 on 16/5/23.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class HomeDetailViewController: BasicViewController {
    //MARK: - property 属性
    var freedomDetail:FreedomDetail = FreedomDetail.init()
    var topView:JYHomeHeadView = JYHomeHeadView.init(frame: CGRectZero)

    
    //MARK: - View Lifecycle （View 的生命周期）
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.initUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadWebData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        self.loadWebData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Custom Accessors （自定义访问器）
    func initUI(){
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topView)
        topView.title.text = "行程详情"
        topView.backBtn.addTarget(self, action:#selector(backBtnPress), forControlEvents: UIControlEvents.TouchUpInside)
        topView.backBtn.hidden = NO
    }
    //加载数据
    func loadWebData(){
        weak var weakSelf = self
        let parmas:NSDictionary = ["id":"210010"]
        searchFreedomById(parmas,sucess:{ (datas) in
            if (!datas.isEqual(NSNull()) ) {
                guard let dicts:NSDictionary = (datas as! NSDictionary) else {return}
                weakSelf!.freedomDetail = FreedomDetail.parse(dict:dicts)
                print(weakSelf?.freedomDetail.pic!)
            }
            },failure: { (errorMsg) in
                
        })

    }
    
    func backBtnPress() {
        self.navigationController?.popViewControllerAnimated(yes)
    }

}
