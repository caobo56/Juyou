//
//  UIButton+Typesetting.swift
//  JuYou
//
//  Created by caobo56 on 16/5/18.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

extension UIButton{

    func setHomeImage(image:UIImage,title:String,stateType:UIControlState){
        let titleSize:CGSize = title.sizeWithAttributes([NSFontAttributeName : UIFont.systemFontOfSize(14.0)])
        self.imageView?.contentMode = UIViewContentMode.Center
        self.imageEdgeInsets = UIEdgeInsetsMake(-20, 0.0, 0.0, -titleSize.width)
        self.setImage(image, forState: stateType)
        self.titleLabel?.contentMode = UIViewContentMode.Center
        self.titleLabel?.backgroundColor = UIColor.clearColor()
        self.titleLabel?.font = UIFont.systemFontOfSize(14.0)
        self.setTitleColor(UIColorWithHex(0x26323B, alpha:1.0), forState: stateType)
        self.titleEdgeInsets = UIEdgeInsetsMake(52.0, -image.width, 0.0, 0.0)
        self.setTitle(title, forState:stateType)
    }
    
    
    func setHorizontalLeftImage(image: UIImage, withTitle title: String, forState stateType: UIControlState, andWithFont fontSize: CGFloat) {
        self.imageView?.contentMode = UIViewContentMode.Center
        self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        self.setImage(image, forState: stateType)
        self.titleLabel!.contentMode = UIViewContentMode.Center
        self.titleLabel!.backgroundColor = UIColor.clearColor()
        self.titleLabel!.font = UIFont.systemFontOfSize(fontSize)
        self.setTitleColor(UIColorWithHex(0x26323B, alpha:1.0), forState: stateType)
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0, 3.0, 0.0, 0.0)
        self.setTitle(title, forState: stateType)
    }
}
