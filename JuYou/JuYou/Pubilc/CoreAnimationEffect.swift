//
//  CoreAnimationEffect
//
//
//  Created by caobo on 15/8/4.
//  Copyright (c) 2015年 totem. All rights reserved.
//


import Foundation
import UIKit
import QuartzCore

class CoreAnimationEffect: NSObject {
    //MARK - Custom Animation
    class func showAnimationType(type: String, withSubType subType: String, duration: CFTimeInterval, timingFunction: String, theView: UIView) {
        let animation: CATransition = CATransition()
        animation.delegate = self
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction.init(name: timingFunction)
        animation.fillMode = kCAFillModeForwards
        animation.type = type
        animation.subtype = subType
        theView.layer.addAnimation(animation, forKey: nil)
    }
    
    //MARK - Preset Animation
    class func animationRevealFromBottom(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.type = kCATransitionReveal
        animation.subtype = kCATransitionFromBottom
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationRevealFromTop(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.type = kCATransitionReveal
        animation.subtype = kCATransitionFromTop
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationRevealFromLeft(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.type = kCATransitionReveal
        animation.subtype = kCATransitionFromLeft
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationRevealFromRight(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.type = kCATransitionReveal
        animation.subtype = kCATransitionFromRight
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationEaseIn(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.type = kCATransitionFade
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseIn)
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationEaseOut(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.type = kCATransitionFade
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationFlipFromLeft(view: UIView) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(0.35)
        UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: false)
        UIView.commitAnimations()
    }
    
    class func animationFlipFromRigh(view: UIView) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
        UIView.setAnimationDuration(0.35)
        UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: false)
        UIView.commitAnimations()
    }
    
    class func animationCurlUp(view: UIView) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(0.35)
        UIView.setAnimationTransition(.CurlUp, forView: view, cache: false)
        UIView.commitAnimations()
    }
    
    class func animationCurlDown(view: UIView) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
        UIView.setAnimationDuration(0.35)
        UIView.setAnimationTransition(.CurlDown, forView: view, cache: false)
        UIView.commitAnimations()
    }
    
    class func animationPushUp(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromTop
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationPushDown(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromBottom
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationPushLeft(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromLeft
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationPushRight(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromRight
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    // presentModalViewController
    
    class func animationMoveUp(view: UIView, duration: CFTimeInterval) {
        let animation: CATransition = CATransition()
        animation.duration = duration
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionMoveIn
        animation.subtype = kCATransitionFromTop
        view.layer.addAnimation(animation, forKey: nil)
    }
    // dissModalViewController
    
    class func animationMoveDown(view: UIView, duration: CFTimeInterval) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromBottom
        view.layer.addAnimation(transition, forKey: nil)
    }
    
    class func animationMoveLeft(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseOut)
        animation.type = kCATransitionMoveIn
        animation.subtype = kCATransitionFromLeft
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationMoveRight(view: UIView) {
        let animation: CATransition = CATransition()
        animation.duration = 0.35
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseOut)
        animation.type = kCATransitionMoveIn
        animation.subtype = kCATransitionFromRight
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    class func animationRotateAndScaleEffects(view: UIView) {
        UIView.animateWithDuration(0.35, animations: {() -> Void in
            view.transform = CGAffineTransformMakeScale(0.001, 0.001)
            let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform")
            // 向右旋转45°缩小到最小,然后再从小到大推出.
            animation.toValue = NSValue(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI), 0.70, 0.40, 0.80))
            animation.duration = 0.45
            animation.repeatCount = 1
            view.layer.addAnimation(animation, forKey: nil)
            }, completion: {(finished: Bool) -> Void in
                UIView.animateWithDuration(0.35, animations: {() -> Void in
                    view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
        })
    }
    
    class func animationRotateAndScaleDownUp(view: UIView) {
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = Int((2 * M_PI) * 2)
        rotationAnimation.duration = 0.35
        rotationAnimation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseInEaseOut)
        let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = Int(0.0)
        scaleAnimation.duration = 0.35
        scaleAnimation.timingFunction = CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseInEaseOut)
        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.duration = 0.35
        animationGroup.autoreverses = true
        animationGroup.repeatCount = 1
        animationGroup.animations = [rotationAnimation, scaleAnimation]
        view.layer.addAnimation(animationGroup, forKey: "animationGroup")
    }
}

