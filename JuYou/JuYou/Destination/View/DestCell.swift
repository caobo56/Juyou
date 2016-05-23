//
//  DestCell.swift
//  JuYou
//
//  Created by caobo56 on 16/5/18.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit

class DestCell: UITableViewCell {
    var imageV: UIImageView? = UIImageView.init()
    var nameLable:UILabel? = UILabel.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.setSize(CGSizeMake(DestCellW, DestCellH))
        self.imageV?.setSize(self.size)
        self.imageV?.center = self.center
        nameLable?.setSize(CGSizeMake(Screen_weight, 55))
        nameLable?.setCenterY(self.height/2)
        nameLable?.textAlignment = NSTextAlignment.Center
        nameLable?.textColor = UIColor.whiteColor()
        nameLable?.font = UIFont.systemFontOfSize(20)
        self.nameLable?.backgroundColor = UIColor.clearColor()
        self.addSubview(self.imageV!)
        self.addSubview(self.nameLable!)
    }
    
    func loadData(dest:DestinationHot){
        self.imageV!.sd_setImageWithURL(NSURL(string: dest.pic!))
        self.nameLable?.text = dest.name
    }
    
}
