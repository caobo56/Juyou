//
//  UIView+DDAddition.swift
//  JuYou
//
//  Created by caobo56 on 16/5/18.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit
import QuartzCore

/**
    几点说明
    1）四边按照内正外负，到superView的边框距离
    left right top bottom
    2）中心点的坐标依照左上角为原点
    center centerX centerY
 */


extension UIView{
    var left:CGFloat {
        return self.frame.origin.x
    }
    
    func setLeft(left:CGFloat){
        var frame:CGRect = self.frame
        frame.origin.x = left
        self.frame = frame
    }
    
    var right:CGFloat {
        return self.frame.origin.x+self.frame.size.width
    }
    
    func setRight(right:CGFloat){
        var frame:CGRect = self.frame
        let spW = self.superview?.width
        frame.origin.x = spW!-right-frame.size.width
        self.frame = frame
    }
    
    var top:CGFloat {
        return self.frame.origin.y
    }
    
    func setTop(top:CGFloat){
        var frame:CGRect = self.frame
        frame.origin.y = top
        self.frame = frame
    }
    
    var bottom:CGFloat {
        return self.frame.origin.y+self.frame.size.height
    }
    
    func setBottom(bottom:CGFloat){
        var frame:CGRect = self.frame
        let spH = self.superview?.height
        frame.origin.y = spH! - bottom - frame.size.height
        self.frame = frame
    }
    
    var centerX:CGFloat {
        return self.center.x
    }
    
    func setCenterX(centerX:CGFloat){
        self.center = CGPointMake(centerX, self.center.y)
    }
    
    var centerY:CGFloat {
        return self.center.y
    }
    
    func setCenterY(centerY:CGFloat){
        self.center = CGPointMake(self.center.x, centerY)
    }
    
    var width:CGFloat {
        return self.frame.size.width
    }
    
    func setWidth(width:CGFloat){
        var frame:CGRect = self.frame
        frame.size.width = width
        self.frame = frame
    }
    
    var height:CGFloat {
        return self.frame.size.height
    }
    
    func setHeight(height:CGFloat){
        var frame:CGRect = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    var origin:CGPoint {
        return self.frame.origin
    }
    
    func setOrigin(origin:CGPoint){
        var frame:CGRect = self.frame
        frame.origin = origin
        self.frame = frame
    }
    
    var size:CGSize{
        return self.frame.size
    }
    
    func setSize(size:CGSize){
        var frame:CGRect = self.frame
        frame.size = size
        self.frame = frame
    }
    
    func removeAllSubviews(){
        while (self.subviews.count != 0){
            let child:UIView = self.subviews.last!
            child.removeFromSuperview()
        }
    }
    
    func subviewWithTag(tag:Int) -> AnyObject {
        for child:UIView in self.subviews {
            if (child.tag == tag) {
                return child
            }
        }
        return self
    }
    
    func viewController(aClass: AnyClass) -> UIViewController?{
        var next=self.superview
        while next != nil {
            let nextResponder = next?.nextResponder()
                if((nextResponder?.isKindOfClass(aClass)) != nil){
                    return nextResponder as? UIViewController
                }else{
                    next=next?.superview
            }

        }
        return nil
//        for(var next=self.superview;(next != nil);next=next?.superview){
//            let nextResponder = next?.nextResponder()
//            if((nextResponder?.isKindOfClass(aClass)) != nil){
//                return nextResponder as? UIViewController
//            }
//        }
//        return nil
    }

    
    func setRoundedCorner(cornerRadius:CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    func setborderWidthAndColor(borderWidth:CGFloat,borderColor:UIColor){
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
    }
    
}


















