//
//  UIImage+Color.swift
//  JuYou
//
//  Created by caobo56 on 16/5/20.
//  Copyright © 2016年 caobo56. All rights reserved.
//

// The output below is limited by 1 KB.
// Please Sign Up (Free!) to remove this limitation.

//
//  UIImage+Color.m
//  jingduoduo
//
//  Created by 刁俊忠 on 15/6/24.
//  Copyright (c) 2015年 totem. All rights reserved.
//
import UIKit

extension UIImage {
    class func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.mainScreen().scale)
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    class func imageWithSize(size: CGSize, borderWidth: CGFloat, color: UIColor, borderColor: UIColor, cornerRadius: CGFloat) -> UIImage {
        let layer: CALayer = CALayer.init()
        layer.bounds = CGRectMake(0, 0, size.width, size.height)
        layer.backgroundColor = color.CGColor
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor
        layer.cornerRadius = cornerRadius
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let ctx: CGContextRef = UIGraphicsGetCurrentContext()!
        layer.renderInContext(ctx)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}