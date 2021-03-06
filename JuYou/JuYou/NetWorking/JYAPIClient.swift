//
//  JYAPIClient.swift
//  JuYou
//
//  Created by caobo56 on 16/5/17.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class JYAPIClient: NSObject {
    
    
    //自由行列表接口
    class func getDestinationSearchHot(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getRequest(kDestinationSearchHot,
                                                 params: params,
                                                 sucess: sucess,
                                                 failure:failure
        )
    }
    
    //首页活动接口&&首页特价接口
    class func getFilterFreedom(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getRequest(kFilterFreedom,
                                                 params: params,
                                                 sucess: sucess,
                                                 failure:failure
        )
    }
    
    //行程详情
    class func searchFreedomById(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getRequest(kSearchFreedomById,
                                                 params: params,
                                                 sucess: sucess,
                                                 failure:failure
        )
    }
    
    class func userLogin(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getLogin(kUserLogin,
                                               params: params,
                                               sucess: sucess,
                                               failure:failure
        )
    }
    
    //获取用户详情
    class func searchUserById(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getRequest(kSearchUserById,
                                                 params: params,
                                                 sucess: sucess,
                                                 failure:failure
        )
    }
    
    //获取注册验证码
    class func getAuthCode(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getAuthCode(kUserGetAuthCode,
                                                  params: params,
                                                  sucess: sucess,
                                                  failure:failure
        )
    }
    
    //注册
    class func regist(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getLogin(kUserRegist,
                                               params: params,
                                               sucess: sucess,
                                               failure:failure
        )
    }
    
    //修改密码
    class func resetPasswordByMobileNum(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getLogin(kResetPasswordByMobileNum,
                                               params: params,
                                               sucess: sucess,
                                               failure:failure
        )
    }
    
    class func searchMonthPay(params:NSDictionary,sucess:SucessBlock,failure:FailureBlock){
        JYNetWorking.sharedNetWorking.getRequest(kSearchMonthPay,
                                                 params: params,
                                                 sucess: sucess,
                                                 failure:failure
        )
    }
    
    
    
}

















