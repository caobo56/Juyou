//
//  UIView+screenshots.swift
//  JuYou
//
//  Created by caobo56 on 16/5/20.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

extension UIView {
    /**
     *  获取全屏截图
     */
    
    func p_getFullScreenshotsWithView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        image = UIImage.init(CGImage: CGImageCreateWithImageInRect(image.CGImage, view.frame)!)
        return image
    }
}
