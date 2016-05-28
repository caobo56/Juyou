//
//  HomeDetailHeadView.swift
//  JuYou
//
//  Created by caobo56 on 16/5/28.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class HomeDetailHeadView: UIView {
    //MARK: - property 属性    
    var headImage = UIImageView.init()
    var titleLable = UILabel.init()
    var price = UILabel.init()
    var mounthPrice = UILabel.init()
    var soled = UILabel.init()
    var rating:TPRatingStart = TPRatingStart.init()
    var supplyImg = UIImageView.init()
    var supplyName = UILabel.init()
    var supplyDes = UILabel.init()
    var agenda = UILabel.init()
    var agendaFeature = UILabel.init()
    var bgTitle = UILabel.init()
    var bgView = UIView.init()
    //MARK: - View Lifecycle （View 的生命周期）

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Accessors （自定义访问器)
    func initUI() {
        self.setSize(CGSizeMake(Screen_weight, 594))
        
        
        
        headImage.setSize(CGSizeMake(Screen_weight, DestCellH))
        self.addSubview(headImage)
        headImage.setOrigin(CGPointMake(0, 0))
        
        titleLable.setSize(CGSizeMake(Screen_weight-20, 30))
        self.addSubview(titleLable)
        titleLable.setCenterX(Screen_weight/2)
        titleLable.setTop(headImage.bottom)
        titleLable.textAlignment = NSTextAlignment.Left
        titleLable.textColor = UIColor.blackColor()
        titleLable.font = UIFont.systemFontOfSize(14.0)
        
        let priceTitle = UILabel.init()
        self.addSubview(priceTitle)
        priceTitle.setSize(CGSizeMake(40, 30))
        priceTitle.text = "总价："
        priceTitle.setLeft(10)
        priceTitle.setTop(titleLable.bottom)
        priceTitle.textAlignment = NSTextAlignment.Left
        priceTitle.textColor = UIColor.blackColor()
        priceTitle.font = UIFont.systemFontOfSize(13.0)
        
        self.addSubview(price)
        price.setSize(CGSizeMake(100, 30))
        price.text = "¥"
        price.setLeft(priceTitle.right)
        price.setTop(titleLable.bottom)
        price.textAlignment = NSTextAlignment.Left
        price.textColor = orangeColor()
        price.font = UIFont.systemFontOfSize(13.0)
        
        let mounthPriceTitle = UILabel.init()
        self.addSubview(mounthPriceTitle)
        mounthPriceTitle.setSize(CGSizeMake(40, 30))
        mounthPriceTitle.text = "月付："
        mounthPriceTitle.setLeft(Screen_weight/2)
        mounthPriceTitle.setTop(titleLable.bottom)
        mounthPriceTitle.textAlignment = NSTextAlignment.Left
        mounthPriceTitle.textColor = UIColor.blackColor()
        mounthPriceTitle.font = UIFont.systemFontOfSize(13.0)
        
        self.addSubview(mounthPrice)
        mounthPrice.setSize(CGSizeMake(100, 30))
        mounthPrice.text = "¥"
        mounthPrice.setLeft(mounthPriceTitle.right)
        mounthPrice.setTop(titleLable.bottom)
        mounthPrice.textAlignment = NSTextAlignment.Left
        mounthPrice.textColor = orangeColor()
        mounthPrice.font = UIFont.systemFontOfSize(13.0)
        
        self.addSubview(soled)
        soled.setSize(CGSizeMake(100, 30))
        soled.text = "已售：6"
        soled.setRight(10)
        soled.setTop(titleLable.bottom)
        soled.textAlignment = NSTextAlignment.Right
        soled.textColor = UIColor.blackColor()
        soled.font = UIFont.systemFontOfSize(13.0)
     
        self.addSubview(rating)
        rating.setTop(soled.bottom)
        rating.setRatingStartLeval(5)
        rating.setRight(10)
        
        let lin1:UIView = UIView.init()
        self.addSubview(lin1)
        lin1.setSize(CGSizeMake(Screen_weight, 1))
        lin1.setTop(rating.bottom)
        lin1.backgroundColor = cellLineColor()
        lin1.setCenterX(Screen_weight/2)
        
        
        let lin2:UIView = UIView.init()
        self.addSubview(lin2)
        lin2.setSize(CGSizeMake(Screen_weight, 1))
        lin2.setTop(rating.bottom+50)
        lin2.backgroundColor = cellLineColor()
        lin2.setCenterX(Screen_weight/2)
        
        supplyImg = UIImageView.init()
        supplyImg.setSize(CGSizeMake(30, 30))
        self.addSubview(supplyImg)
        supplyImg.setLeft(55)
        supplyImg.setCenterY(lin1.bottom/2+lin2.bottom/2)
        supplyImg.backgroundColor = UIColor.grayColor()
        
        let supplyNameLable = UILabel.init()
        self.addSubview(supplyNameLable)
        supplyNameLable.setSize(CGSizeMake(50, 15))
        supplyNameLable.text = "供应商"
        supplyNameLable.setLeft(10+supplyImg.right)
        supplyNameLable.setTop(supplyImg.top)
        supplyNameLable.textAlignment = NSTextAlignment.Left
        supplyNameLable.textColor = UIColor.blackColor()
        supplyNameLable.font = UIFont.systemFontOfSize(13.0)
        
        self.addSubview(supplyName)
        supplyName.setSize(CGSizeMake(70, 15))
        supplyName.text = "上杭假期"
        supplyName.setLeft(10+supplyImg.right)
        supplyName.setTop(supplyNameLable.bottom)
        supplyName.textAlignment = NSTextAlignment.Left
        supplyName.textColor = cellLineColor()
        supplyName.font = UIFont.systemFontOfSize(13.0)
        
        let lin3:UIView = UIView.init()
        self.addSubview(lin3)
        lin3.setSize(CGSizeMake(1, 40))
        lin3.setCenterY(supplyImg.centerY)
        lin3.backgroundColor = cellLineColor()
        lin3.setCenterX(Screen_weight/2)

        self.addSubview(supplyDes)
        supplyDes.setSize(CGSizeMake(Screen_weight/2, 30))
        supplyDes.text = "提前1天预定"
        supplyDes.setRight(0)
        supplyDes.setCenterY(supplyImg.centerY)
        supplyDes.textAlignment = NSTextAlignment.Center
        supplyDes.textColor = cellLineColor()
        supplyDes.font = UIFont.systemFontOfSize(13.0)
        
        let agendaTitle = UILabel.init()
        self.addSubview(agendaTitle)
        agendaTitle.setSize(CGSizeMake(60, 20))
        agendaTitle.text = "游玩日期："
        agendaTitle.setLeft(15)
        agendaTitle.setTop(lin2.bottom)
        agendaTitle.textAlignment = NSTextAlignment.Left
        agendaTitle.textColor = lightBlueColor()
        agendaTitle.font = UIFont.systemFontOfSize(12.0)
        
        self.addSubview(agenda)
        agenda.setSize(CGSizeMake(Screen_weight/2, 20))
        agenda.text = "5月6月可多选"
        agenda.setLeft(agendaTitle.right)
        agenda.setTop(agendaTitle.top)
        agenda.textAlignment = NSTextAlignment.Left
        agenda.textColor = UIColor.blackColor()
        agenda.font = UIFont.systemFontOfSize(12.0)
        
        let featureTitle = UILabel.init()
        self.addSubview(featureTitle)
        featureTitle.setSize(CGSizeMake(Screen_weight-40, 40))
        featureTitle.text = "行程特色"
        featureTitle.setLeft(10)
        featureTitle.setTop(agenda.bottom+5)
        featureTitle.textAlignment = NSTextAlignment.Left
        featureTitle.textColor = lightBlueColor()
        featureTitle.font = UIFont.systemFontOfSize(14.0)
        
        self.addSubview(agendaFeature)
        agendaFeature.setSize(CGSizeMake(Screen_weight-20, 80))
        agendaFeature.text = ""
        agendaFeature.setLeft(10)
        agendaFeature.setTop(featureTitle.bottom)
        agendaFeature.numberOfLines = 0; // 最关键的一句
        agendaFeature.textAlignment = NSTextAlignment.Left
        agendaFeature.textColor = UIColor.blackColor()
        agendaFeature.font = UIFont.systemFontOfSize(13.0)
        
        bgView.setSize(CGSizeMake(Screen_weight-20, 30))
        self.addSubview(bgView)
        bgView.backgroundColor = topBuleColor()
        bgView.setTop(agendaFeature.bottom)
        bgView.setLeft(10)
        
        self.addSubview(bgTitle)
        bgTitle.setSize(CGSizeMake(80, 30))
        bgTitle.text = "行程概要："
        bgTitle.setLeft(15)
        bgTitle.setCenterY(bgView.centerY)
        bgTitle.textAlignment = NSTextAlignment.Left
        bgTitle.textColor = UIColor.whiteColor()
        bgTitle.font = UIFont.systemFontOfSize(13.0)
        
    }
    
    func loadData(freedomDetail:FreedomDetail) {
        self.titleLable.text = freedomDetail.title
        self.price.text = ("¥"+String(freedomDetail.price))
        self.mounthPrice.text = ("¥"+String(freedomDetail.price/10))
        self.soled.text = ("已售："+String(freedomDetail.sell_count))
        self.headImage.sd_setImageWithURL(NSURL(string: freedomDetail.pic!))
        self.agenda.text = freedomDetail.travel_date
        self.supplyImg.sd_setImageWithURL(NSURL(string: freedomDetail.prividerPic!))
        self.agendaFeature.text = freedomDetail.feature
        self.agendaFeature.setHeight(JYCuxtomTool.textHeightFromTextString(freedomDetail.feature!, textWidth:Screen_weight-20, fontSize: 13.0, isBold: NO))
        self.bgView.setTop(agendaFeature.bottom+5)
        self.bgTitle.setCenterY(self.bgView.centerY)
        self.setSize(CGSizeMake(Screen_weight, bgView.bottom))
    }
}


















