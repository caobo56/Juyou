//
//  NavBarViewController.swift
//  JuYou
//
//  Created by caobo56 on 16/5/18.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class JYNavBarViewController: UITabBarController {
    //MARK: - property 属性
    var bottomView:JYHomeBottomView = JYHomeBottomView.init(frame: CGRectZero)
    
    //MARK: - View Lifecycle （View 的生命周期）
    override func awakeFromNib() {
        self.setTabBarUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Custom Accessors （自定义访问器）
    func setTabBarUI() {
        self.tabBar.hidden = true
        self.view.addSubview(bottomView)
        self.bottomView.setBottom(0)
        bottomView.homeBtn.addTarget(self, action:#selector(JYNavBarViewController.homeBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        bottomView.destinationBtn.addTarget(self, action:#selector(JYNavBarViewController.destinationClick), forControlEvents: UIControlEvents.TouchUpInside)
        bottomView.mineBtn.addTarget(self, action:#selector(JYNavBarViewController.mineBtnPress), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    @objc private func homeBtnClick() {
        self.selectedIndex = 0
    }
    
    @objc private func destinationClick() {
        self.selectedIndex = 1
    }
    
    @objc private func mineBtnPress() {
        self.selectedIndex = 2
    }
    
    //MARK: - IBActions
    
}
