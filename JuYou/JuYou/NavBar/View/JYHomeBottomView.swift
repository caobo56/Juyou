//
//  JYHomeBottomView.swift
//  JuYou
//
//  Created by caobo56 on 16/5/18.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class JYHomeBottomView: UIView {
    //MARK: - property 属性
    
    var homeBtn:UIButton = UIButton.init()
    var destinationBtn:UIButton = UIButton.init()
    var mineBtn:UIButton = UIButton.init()
    
    //MARK: - View Lifecycle （View 的生命周期）
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Custom Accessors （自定义访问器）
    func initUI() {
        self.setSize(CGSizeMake(Screen_weight, TabBarH*1.5))
        self.setLeft(0)
        self.backgroundColor = UIColorWithHex(0x000000,alpha: 0.3)
        
        homeBtn.setSize(CGSizeMake(self.width/3, self.height))
        homeBtn.setLeft(0)
        homeBtn.setHomeImage(UIImage.init(named: "home")!, title:"首页", stateType: UIControlState.Normal)
        homeBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self .addSubview(homeBtn)
        
        destinationBtn.setSize(CGSizeMake(self.width/3, self.height))
        destinationBtn.setLeft(Screen_weight/3)
        destinationBtn.setHomeImage(UIImage.init(named: "destination")!, title:"目的地", stateType: UIControlState.Normal)
        destinationBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self .addSubview(destinationBtn)
        
        mineBtn.setSize(CGSizeMake(self.width/3, self.height))
        mineBtn.setLeft(2*Screen_weight/3)
        mineBtn.setHomeImage(UIImage.init(named: "mine")!, title:"我", stateType: UIControlState.Normal)
        mineBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self .addSubview(mineBtn)
        
    }
}






















