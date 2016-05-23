//
//  JYHomeHeadView.swift
//  JuYou
//
//  Created by caobo56 on 16/5/19.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class JYHomeHeadView: UIView {
    //MARK: - property 属性
    var title:UILabel = UILabel.init(frame: CGRectMake(0, 0, 150, NavBarH))
    var backBtn:UIButton = UIButton.init(type: UIButtonType.Custom)
    
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
        self.backgroundColor = UIColorWithHex(0x268cff, alpha: 1.0)
        self.setSize(CGSizeMake(Screen_weight, NavBarH+StateBarH))
        self.setOrigin(CGPointMake(0, 0))
        self.addSubview(title)
        title.setCenterX(Screen_weight/2)
        title.setBottom(0)
        title.textAlignment = NSTextAlignment.Center
        title.textColor = UIColorWithHex(0xFFFFFF, alpha: 1.0)
        title.font = UIFont.systemFontOfSize(18)
        self.addSubview(backBtn)
        self.backBtn.hidden = yes
        let back: UIImage = UIImage(named: "back")!
        self.backBtn.setSize(CGSizeMake(50, back.size.height * 3))
        self.backBtn.setLeft(10)
        self.backBtn.setCenterY((self.height - 20) / 2 + 20 - 2)
        backBtn.setHorizontalLeftImage(back, withTitle: "返回", forState: .Normal, andWithFont: 15)
        backBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)        
    }
}
