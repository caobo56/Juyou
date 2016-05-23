//
//  ISHotHeadView.swift
//  JuYou
//
//  Created by caobo56 on 16/5/19.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit
import SDWebImage

class ISHotHeadView: UIView{
    //MARK: - property 属性

    var imageURLArray: [String] = ["http://101.200.164.224/juyou_statics/data/img/freedom/210015.jpg"]
    var cyclePictureView: CyclePictureView!
    var imageVLeft: UIImageView? = UIImageView.init()
    var imageVRight: UIImageView? = UIImageView.init()
    
    //MARK: - View Lifecycle （View 的生命周期）
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Accessors （自定义访问器）
    func initUI() {
        let he = DestCellH+30+(((Screen_weight-30)/2)/690*360)+30
        self.setSize(CGSizeMake(Screen_weight,he ))
        self.backgroundColor = UIColor.whiteColor()

        self.cyclePictureView = CyclePictureView(frame: CGRectMake(0, 0, Screen_weight, DestCellH), imageURLArray: self.imageURLArray)
        self.addSubview(self.cyclePictureView)
        self.cyclePictureView.backgroundColor = UIColor.whiteColor()
        self.cyclePictureView.timeInterval = 2
        self.cyclePictureView.pageControlAliment = .RightBottom
        
        self.addSubview(imageVLeft!)
        self.imageVLeft!.setSize(CGSizeMake((Screen_weight-30)/2,(Screen_weight-30)/2/690*360))
        self.imageVLeft!.setOrigin(CGPointMake(10, self.cyclePictureView.bottom+10))
        self.imageVLeft?.sd_setImageWithURL(NSURL(string: "http://juyoufenqi.com/juyou/resource/upload/tongxue.png"))
        
        self.addSubview(imageVRight!)
        self.imageVRight!.setSize(CGSizeMake((Screen_weight-30)/2,(Screen_weight-30)/2/690*360))
        self.imageVRight!.setOrigin(CGPointMake((self.imageVLeft?.right)!+10, self.cyclePictureView.bottom+10))
        self.imageVRight?.sd_setImageWithURL(NSURL(string: "http://juyoufenqi.com/juyou/resource/upload/youxue.png"))
        
        let lineView = UIView.init(frame: CGRectMake(0, (self.imageVRight?.bottom)!+10, Screen_weight, 10))
        lineView.backgroundColor = UIColorWithHex(0xeeeeee, alpha: 1.0)
        self.addSubview(lineView)
        
        let titleLable:UILabel = UILabel.init(frame: CGRectMake(10, lineView.bottom, 200, 30))
        titleLable.text = "热门路线"
        titleLable.textAlignment = NSTextAlignment.Left
        titleLable.font = UIFont.systemFontOfSize(14)
        titleLable.textColor = UIColorWithHex(0xFF7F05,alpha: 1.0)
        self.addSubview(titleLable)
        
    }
    
    func loadData(fits:[Filterfreedom]){
        imageURLArray.removeAll()
        for fit:Filterfreedom in fits{
            imageURLArray.append(fit.pic!)
        }
        cyclePictureView.imageURLArray = imageURLArray
    }
    

}
