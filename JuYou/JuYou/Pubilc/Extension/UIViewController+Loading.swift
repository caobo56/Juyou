//
//  UIViewController+Loading.swift
//  JuYou
//
//  Created by caobo56 on 16/5/19.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit
import JGProgressHUD

extension UIViewController{
    func showLoadingHUD() {
        let HUD:JGProgressHUD = JGProgressHUD.init(style: JGProgressHUDStyle.Dark)
        HUD.textLabel.text = nil
        HUD.userInteractionEnabled = yes
        HUD.position = JGProgressHUDPosition.Center
        HUD.showInView(self.view)
    }
    
    func showLoadingHUDWithText(str:String) {
        let HUD:JGProgressHUD = JGProgressHUD.init(style: JGProgressHUDStyle.Dark)
        HUD.textLabel.text = str
        HUD.userInteractionEnabled = yes
        HUD.position = JGProgressHUDPosition.Center
        HUD.showInView(self.view)
    }
    
    func showHUDWithSuccess(str:String) {
        let huds:[JGProgressHUD] = JGProgressHUD.allProgressHUDsInView(self.view) as! [JGProgressHUD]
        if (huds.count > 0) {
            for hud:JGProgressHUD in huds {
                hud.indicatorView = nil
                hud.textLabel.text = str
                hud.position = JGProgressHUDPosition.Center
                hud.dismissAfterDelay(1.0)
            }
        }

    }
    
    func showHUDWithText(str:String) {
        let HUD:JGProgressHUD = JGProgressHUD.init(style: JGProgressHUDStyle.Dark)
        HUD.textLabel.text = str
        HUD.userInteractionEnabled = yes
        HUD.position = JGProgressHUDPosition.Center
        HUD.marginInsets = UIEdgeInsetsMake(0, 0, Screen_height/2, 0)
        HUD.showInView(self.view)
        HUD.dismissAfterDelay(1.0)
    }
    
    func hideAllHUD() {
        let huds:[JGProgressHUD] = JGProgressHUD.allProgressHUDsInView(self.view) as! [JGProgressHUD]
        if (huds.count > 0) {
            for hud:JGProgressHUD in huds {
                hud.dismiss()
            }
        }
    }
}
