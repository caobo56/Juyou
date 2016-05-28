//
//  HomeDetailFootView.swift
//  JuYou
//
//  Created by caobo56 on 16/5/28.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class HomeDetailFootView: UIView {
    var searchDetail = UIButton.init(type: UIButtonType.Custom)
    var bgTitle = UILabel.init()
    var bgView = UIView.init()
    var priceContain = UILabel.init()
    var priceNotContainLable = UILabel.init()
    var priceNotContain = UILabel.init()
    var trafficLable = UILabel.init()
    var hotelLable = UILabel.init()
    var traffic = UILabel.init()
    var hotel = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.setSize(CGSizeMake(Screen_weight, 500))
     
        searchDetail.setSize(CGSizeMake(self.width/2, 40))
        searchDetail.setCenterX(Screen_weight/2)
        searchDetail.setTop(5)
        searchDetail.setHorizontalRightImage(UIImage.init(named: "price")!, title:"查看详细行程", stateType: UIControlState.Normal,fontSize: 14.0)
        searchDetail.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        self .addSubview(searchDetail)
        
        
        bgView.setSize(CGSizeMake(Screen_weight-20, 30))
        self.addSubview(bgView)
        bgView.backgroundColor = topBuleColor()
        bgView.setTop(searchDetail.bottom+5)
        bgView.setLeft(10)
        
        self.addSubview(bgTitle)
        bgTitle.setSize(CGSizeMake(80, 30))
        bgTitle.text = "费用相关"
        bgTitle.setLeft(15)
        bgTitle.setCenterY(bgView.centerY)
        bgTitle.textAlignment = NSTextAlignment.Left
        bgTitle.textColor = UIColor.whiteColor()
        bgTitle.font = UIFont.systemFontOfSize(13.0)
        
        let priceContainLable = UILabel.init()
        self.addSubview(priceContainLable)
        priceContainLable.setSize(CGSizeMake(Screen_weight-40, 40))
        priceContainLable.text = "费用包含"
        priceContainLable.setLeft(10)
        priceContainLable.setTop(bgTitle.bottom+5)
        priceContainLable.textAlignment = NSTextAlignment.Left
        priceContainLable.textColor = lightBlueColor()
        priceContainLable.font = UIFont.systemFontOfSize(14.0)
        
        self.addSubview(priceContain)
        priceContain.setSize(CGSizeMake(Screen_weight-20, 40))
        priceContain.text = ""
        priceContain.setLeft(10)
        priceContain.setTop(priceContainLable.bottom)
        priceContain.numberOfLines = 0; // 最关键的一句
        priceContain.textAlignment = NSTextAlignment.Left
        priceContain.textColor = UIColor.blackColor()
        priceContain.font = UIFont.systemFontOfSize(13.0)
        
        self.addSubview(priceNotContainLable)
        priceNotContainLable.setSize(CGSizeMake(Screen_weight-40, 40))
        priceNotContainLable.text = "费用不包含"
        priceNotContainLable.setLeft(10)
        priceNotContainLable.setTop(priceContain.bottom)
        priceNotContainLable.textAlignment = NSTextAlignment.Left
        priceNotContainLable.textColor = lightBlueColor()
        priceNotContainLable.font = UIFont.systemFontOfSize(14.0)
        
        self.addSubview(priceNotContain)
        priceNotContain.setSize(CGSizeMake(Screen_weight-20, 40))
        priceNotContain.text = ""
        priceNotContain.setLeft(10)
        priceNotContain.setTop(priceNotContainLable.bottom)
        priceNotContain.numberOfLines = 0; // 最关键的一句
        priceNotContain.textAlignment = NSTextAlignment.Left
        priceNotContain.textColor = UIColor.blackColor()
        priceNotContain.font = UIFont.systemFontOfSize(13.0)
        
        self.addSubview(trafficLable)
        trafficLable.setSize(CGSizeMake(Screen_weight-40, 40))
        trafficLable.text = "交通信息"
        trafficLable.setLeft(10)
        trafficLable.setTop(priceNotContain.bottom)
        trafficLable.textAlignment = NSTextAlignment.Left
        trafficLable.textColor = lightBlueColor()
        trafficLable.font = UIFont.systemFontOfSize(14.0)
        
        self.addSubview(traffic)
        traffic.setSize(CGSizeMake(Screen_weight-20, 40))
        traffic.text = ""
        traffic.setLeft(10)
        traffic.setTop(trafficLable.bottom)
        traffic.numberOfLines = 0; // 最关键的一句
        traffic.textAlignment = NSTextAlignment.Left
        traffic.textColor = UIColor.blackColor()
        traffic.font = UIFont.systemFontOfSize(13.0)
        
        self.addSubview(hotelLable)
        hotelLable.setSize(CGSizeMake(Screen_weight-40, 40))
        hotelLable.text = "住宿信息"
        hotelLable.setLeft(10)
        hotelLable.setTop(traffic.bottom)
        hotelLable.textAlignment = NSTextAlignment.Left
        hotelLable.textColor = lightBlueColor()
        hotelLable.font = UIFont.systemFontOfSize(14.0)
        
        self.addSubview(hotel)
        hotel.setSize(CGSizeMake(Screen_weight-20, 40))
        hotel.text = ""
        hotel.setLeft(10)
        hotel.setTop(hotelLable.bottom)
        hotel.numberOfLines = 0; // 最关键的一句
        hotel.textAlignment = NSTextAlignment.Left
        hotel.textColor = UIColor.blackColor()
        hotel.font = UIFont.systemFontOfSize(13.0)
    }
    
    func loadData(freedomDetail:FreedomDetail) {
        self.priceContain.text = freedomDetail.priceContain
        self.priceContain.setHeight(JYCuxtomTool.textHeightFromTextString(freedomDetail.priceContain!, textWidth:Screen_weight-20, fontSize: 13.0, isBold: NO))
        
        self.priceNotContain.text = freedomDetail.priceNotContain
        self.priceNotContain.setHeight(JYCuxtomTool.textHeightFromTextString(freedomDetail.priceNotContain!, textWidth:Screen_weight-20, fontSize: 13.0, isBold: NO))
        priceNotContainLable.setTop(self.priceContain.bottom)
        priceNotContain.setTop(self.priceContain.bottom+40)

        self.traffic.text = freedomDetail.traffic
        self.traffic.setHeight(JYCuxtomTool.textHeightFromTextString(freedomDetail.traffic!, textWidth:Screen_weight-20, fontSize: 13.0, isBold: NO))
        trafficLable.setTop(self.priceNotContain.bottom)
        traffic.setTop(self.priceNotContain.bottom+40)
        
        self.hotel.text = freedomDetail.hotel
        self.hotel.setHeight(JYCuxtomTool.textHeightFromTextString(freedomDetail.hotel!, textWidth:Screen_weight-20, fontSize: 13.0, isBold: NO))
        hotelLable.setTop(self.traffic.bottom)
        hotel.setTop(self.traffic.bottom+40)

        self.setSize(CGSizeMake(Screen_weight, hotel.bottom+TabBarH))
    }
}
