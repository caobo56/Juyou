//
//  BasicViewController.swift
//  JuYou
//
//  Created by caobo56 on 16/5/23.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {
    //MARK: - View Lifecycle （View 的生命周期）
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = yes
        NavBarVC.hidesBottomBar(yes)
        //        self.loadWebData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
