//
//  JYNetWorking.swift
//  JuYou
//
//  Created by caobo56 on 16/5/16.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import Foundation
import Alamofire
import JGProgressHUD


//定义block
typealias SucessBlock = (data :AnyObject) ->()
typealias FailureBlock = (data :AnyObject) ->()

class JYNetWorking: NSObject {
    class var sharedNetWorking : JYNetWorking {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : JYNetWorking? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = JYNetWorking()
        }
        return Static.instance!
    }

    func getRequest(interfaceName:String,params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        RootVC!.showLoadingHUD()
        Alamofire.request(.POST, SERVER_URL(interfaceName),parameters: params as? [String : AnyObject]).responseJSON() {
            response in
            RootVC?.hideAllHUD()
            guard let value = response.result.value else {
                sucess(data: NSNull())
                failure(data: FAILURE_CODE)
                RootVC!.showHUDWithText("请求发送失败，请稍后重试！")
                return
            }
            print(response.result.value)
            let json = JSON(value)
            if(json["isSuccess"].intValue == SUCCESS_CODE){
                let datas:AnyObject = value.valueForKey("datas")!
                sucess(data: datas)
                failure(data: json["isSuccess"].intValue)
            }else{
                if (json["errorCode"].intValue > HUDERROR_CODE){
                   //此处为请求链接成功，后台失败errorCode>HUDERROR_CODE时，需弹出HUD
                    RootVC!.showHUDWithText(json["errorMsg"].string!)
                }//可能会改为 switch-case 看具体业务需求弹相应的HUD
                sucess(data: NSNull())
                failure(data: FAILURE_CODE)
            }
        }
    }
    
    func getLogin(interfaceName:String,params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        RootVC!.showLoadingHUD()
        Alamofire.request(.POST, SERVER_URL(interfaceName),parameters: params as? [String : AnyObject]).responseJSON() {
            response in
            RootVC?.hideAllHUD()
            guard let value = response.result.value else {
                sucess(data: NSNull())
                failure(data: FAILURE_CODE)
                RootVC!.showHUDWithText("请求发送失败，请稍后重试！")
                return
            }
            let json = JSON(value)
            if(json["isSuccess"].intValue == SUCCESS_CODE){
                print(value.valueForKey("userInfo"))
                let datas:AnyObject = value.valueForKey("userInfo")!
                sucess(data: datas)
                failure(data: json["isSuccess"].intValue)
            }else{
                if (json["errorCode"].intValue > HUDERROR_CODE){
                    //此处为请求链接成功，后台失败errorCode>HUDERROR_CODE时，需弹出HUD
                    RootVC!.showHUDWithText(json["errorMsg"].string!)
                }//可能会改为 switch-case 看具体业务需求弹相应的HUD
                sucess(data: NSNull())
                failure(data: FAILURE_CODE)
            }
        }
    }
    
    func getAuthCode(interfaceName:String,params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        RootVC!.showLoadingHUD()
        Alamofire.request(.POST, SERVER_URL(interfaceName),parameters: params as? [String : AnyObject]).responseJSON() {
            response in
            RootVC?.hideAllHUD()
            guard let value = response.result.value else {
                sucess(data: NSNull())
                failure(data: FAILURE_CODE)
                RootVC!.showHUDWithText("请求发送失败，请稍后重试！")
                return
            }
            
            let json = JSON(value)
            if(json["isSuccess"].intValue == SUCCESS_CODE){
                let datas:AnyObject = value.valueForKey("authCode")!
                sucess(data: datas)
                failure(data: json["isSuccess"].intValue)
            }else{
                if (json["errorCode"].intValue > HUDERROR_CODE){
                    //此处为请求链接成功，后台失败errorCode>HUDERROR_CODE时，需弹出HUD
                    RootVC!.showHUDWithText(json["errorMsg"].string!)
                }//可能会改为 switch-case 看具体业务需求弹相应的HUD
                sucess(data: NSNull())
                failure(data: FAILURE_CODE)
            }
        }
    }

    
}
