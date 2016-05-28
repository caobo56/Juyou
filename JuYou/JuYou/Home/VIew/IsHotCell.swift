//
//  IsHotCell.swift
//  JuYou
//
//  Created by caobo56 on 16/5/19.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class IsHotCell: UITableViewCell {
    //MARK: - property 属性
    var imageV: UIImageView? = UIImageView.init()
    var monthPriceLable:UILabel? = UILabel.init()
    var titleLable: UILabel? = UILabel.init()
    var totalPrice:UILabel? = UILabel.init()
    var travel_dateLable:UILabel? = UILabel.init()
    var team_typeLable:UILabel? = UILabel.init()
    
    //MARK: - View Lifecycle （View 的生命周期）
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Accessors （自定义访问器）
    func initUI(){
        self.setSize(CGSizeMake(IsHotsCellW,IsHotsCellH))
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        self.addSubview(self.imageV!)
        self.imageV?.setSize(CGSizeMake(IsHotsCellW,IsHotsCellH-62))
        self.imageV?.setOrigin(CGPointMake(0, 0))
        
        self.addSubview(self.monthPriceLable!)
        self.monthPriceLable?.setSize(CGSizeMake(70,20))
        self.monthPriceLable?.setRight(10)
        self.monthPriceLable?.setTop(10)
        self.monthPriceLable?.backgroundColor = UIColorWithHex(0xFF7F05,alpha: 1.0)
        self.monthPriceLable?.textColor = UIColor.whiteColor()
        self.monthPriceLable?.font = UIFont.systemFontOfSize(12)
        self.monthPriceLable?.textAlignment = NSTextAlignment.Center
        self.monthPriceLable?.setRoundedCorner(1)

        
        self.addSubview(self.travel_dateLable!)
        self.travel_dateLable?.setSize(CGSizeMake(200, 20))
        self.travel_dateLable?.setRight(10)
        self.travel_dateLable?.setBottom(10)
        self.travel_dateLable?.textColor = UIColorWithHex(0xA5A5A5, alpha: 1.0)
        self.travel_dateLable?.font = UIFont.systemFontOfSize(12)
        self.travel_dateLable?.textAlignment = NSTextAlignment.Right
        
        let totalName:UILabel = UILabel.init()
        self.addSubview(totalName)
        totalName.setSize(CGSizeMake(40, 20))
        totalName.setLeft(10)
        totalName.setBottom(10)
        totalName.textColor = UIColorWithHex(0xA5A5A5, alpha: 1.0)
        totalName.font = UIFont.systemFontOfSize(12)
        totalName.textAlignment = NSTextAlignment.Left
        totalName.text = "总价："
        
        self.addSubview(self.totalPrice!)
        self.totalPrice?.setSize(CGSizeMake(70, 20))
        self.totalPrice?.setLeft(totalName.right)
        self.totalPrice?.setBottom(10)
        self.totalPrice?.textColor = UIColorWithHex(0xFF7F05, alpha: 1.0)
        self.totalPrice?.font = UIFont.systemFontOfSize(12)
        self.totalPrice?.textAlignment = NSTextAlignment.Left
        
        self.addSubview(self.team_typeLable!)
        self.team_typeLable?.setSize(CGSizeMake(70, 25))
        self.team_typeLable?.setLeft(totalName.left)
        self.team_typeLable?.setTop((self.imageV?.bottom)!+6)
        self.team_typeLable?.textColor = UIColorWithHex(0x007dc6, alpha: 1.0)
        self.team_typeLable?.font = UIFont.systemFontOfSize(12)
        self.team_typeLable?.setborderWidthAndColor(1, borderColor: lightBlueColor())
        self.team_typeLable?.textAlignment = NSTextAlignment.Center
        self.team_typeLable?.setRoundedCorner(3)
        self.team_typeLable?.text = "自由行"
        
        self.addSubview(self.titleLable!)
        let titleLableW = (Screen_weight-(self.team_typeLable?.right)!-5)
        self.titleLable?.setSize(CGSizeMake(titleLableW,30))
        self.titleLable?.setLeft((self.team_typeLable?.right)!+5)
        self.titleLable!.setCenterY((self.team_typeLable?.centerY)!)
        self.titleLable?.textColor = UIColor.darkTextColor()
        self.titleLable?.textAlignment = NSTextAlignment.Left
        self.titleLable?.font = UIFont.systemFontOfSize(14)
        
    }
    
    func loadData(fits:Filterfreedom){
        self.imageV!.sd_setImageWithURL(NSURL(string: fits.pic!))
        self.monthPriceLable?.text = ("月付"+String(fits.monthPrice)+"元")
        self.travel_dateLable?.text = fits.travel_date
        self.totalPrice?.text = ("¥"+String(fits.price))
        self.titleLable?.text = fits.title
    }
}





