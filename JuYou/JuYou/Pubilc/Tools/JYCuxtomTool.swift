//
//  JYCuxtomTool.swift
//  JuYou
//
//  Created by caobo56 on 16/5/20.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class JYCuxtomTool: NSObject {
    
    /** 
     ** lineView:       需要绘制成虚线的view
     ** lineLength:     虚线的宽度
     ** lineSpacing:    虚线的间距
     ** lineColor:      虚线的颜色
     **/
    class func drawDashLine(lineView: UIView, lineLength: Int, lineSpacing: Int, lineColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        let shapeLayer: CAShapeLayer = CAShapeLayer.init()
        shapeLayer.bounds = lineView.bounds
        shapeLayer.position = CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame) / 2)
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        //  设置虚线颜色为blackColor
        shapeLayer.strokeColor = lineColor.CGColor
        //  设置虚线宽度
        shapeLayer.lineWidth = 1.0
        shapeLayer.lineJoin = kCALineJoinRound
        //  设置线宽，线间距
        shapeLayer.lineDashPattern = [Int(lineLength), Int(lineSpacing)]
        //  设置路径
        let path: CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y)
        CGPathAddLineToPoint(path, nil, endPoint.x, endPoint.y)
        shapeLayer.path = path
        //  把绘制好的虚线添加上来
        lineView.layer.addSublayer(shapeLayer)
    }
    
    /**
     @method 获取指定宽度情况下，字符串value的高度
     @param value 待计算的字符串
     @param fontSize 字体的大小
     @param andWidth 限制字符串显示区域的宽度
     @result float 返回的高度
     */
    class func textHeightFromTextString(text: String, textWidth: CGFloat, fontSize: CGFloat, isBold: Bool) -> CGFloat{
            var dict: NSDictionary = NSDictionary()
            if (isBold) {
                dict = NSDictionary(object: UIFont.boldSystemFontOfSize(fontSize), forKey: NSFontAttributeName)
            } else {
                dict = NSDictionary(object: UIFont.systemFontOfSize(fontSize), forKey: NSFontAttributeName)
            }
            
            let rect: CGRect = (text as NSString).boundingRectWithSize(CGSizeMake(textWidth, CGFloat(MAXFLOAT)), options: [NSStringDrawingOptions.TruncatesLastVisibleLine, NSStringDrawingOptions.UsesFontLeading, NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: dict as? [String : AnyObject], context: nil)
            return rect.size.height
        }
    
    
    /**
     @method 获取未指定宽度情况下，字符串value的宽度
     @param value 待计算的字符串
     @param fontSize 字体的大小
     @result float 返回的高度
     */
    class func widthForString(value: String, fontSize: CGFloat) -> CGFloat {
        let dict: NSDictionary = NSDictionary(object: UIFont.systemFontOfSize(fontSize), forKey: NSFontAttributeName)
        let rect: CGRect = (value as NSString).boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)), options: [NSStringDrawingOptions.TruncatesLastVisibleLine, NSStringDrawingOptions.UsesFontLeading, NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: dict as? [String : AnyObject], context: nil)
        return rect.size.width
    }
}













