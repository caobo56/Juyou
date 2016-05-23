//
//  JYConstant.swift
//  JuYou
//
//  Created by caobo56 on 16/5/17.
//  Copyright © 2016年 caobo56. All rights reserved.
//


import UIKit

let kMAIN_SIZE = UIScreen.mainScreen().bounds

let SUCCESS_CODE = 1
let FAILURE_CODE = 0
let HUDERROR_CODE = 1000

let kHOST_ProDuct = 1   //1 是生产环境  0 测试环境

func SERVER_URL(interfaceName:String) -> String {
    var SERVER_URL = ""
    if (kHOST_ProDuct == 1){// 1 生产  0 测试
        //正式服务器
         SERVER_URL="http://juyoufenqi.com/juyou"+interfaceName
    }else{
        //测试服务器
         SERVER_URL="http://juyoufenqi.com/juyou"+interfaceName
    }
    
    return SERVER_URL
}

//MARK 常量和宏方法
let Screen_height=UIScreen.mainScreen().bounds.size.height
let Screen_weight=UIScreen.mainScreen().bounds.size.width

let StateBarH:CGFloat=20
let NavBarH:CGFloat=44
let TabBarH:CGFloat=49

let YES=true
let NO=false

func AccuratePrice(num:NSNumber) -> String {
	let accuratePrice:String =  String(format: "%.02f", num.floatValue)
    //Swift中仍旧可以这样用，有木有感到惊喜！    
    return accuratePrice
}

func rateLangth(a:CGFloat) -> CGFloat {
    return (a*(Screen_weight/320.0))
}

func UIColorWithHex(hex:UInt,alpha:CGFloat) -> UIColor {
    var red:CGFloat, green:CGFloat, blue:CGFloat
    red = ((CGFloat)((hex >> 16) & 0xFF)) / (0xFF)
    green = ((CGFloat)((hex >> 8) & 0xFF)) / (0xFF)
    blue = ((CGFloat)((hex >> 0) & 0xFF)) / (0xFF)
    return UIColor(red: red, green: green, blue: blue, alpha:alpha)
}

let APPDelegate = (UIApplication.sharedApplication().delegate) as! AppDelegate
let RootVC = APPDelegate.window?.rootViewController
let NavBarVC = RootVC as! JYNavBarViewController
let NavBar = NavBarVC.bottomView


//MARK 接口名称
let kDestinationSearchHot="/destination/searchHot.do"
let kFilterFreedom="/freedom/filterFreedom.do"






