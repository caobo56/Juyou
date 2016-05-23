//
//  SecondViewController.swift
//  JuYou
//
//  Created by caobo56 on 16/5/16.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit
import MJRefresh

let DestCellW=Screen_weight
let DestCellH=Screen_weight/690*360

class DestinationViewController: BasicViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK: - property 属性
    var dests:DestinationHots = DestinationHots.init()
    var topView:JYHomeHeadView = JYHomeHeadView.init(frame: CGRectZero)
    var tableView:UITableView = UITableView.init()
    let identifier = "DestCell"
    //MARK: - View Lifecycle （View 的生命周期）
    override func awakeFromNib() {
        self.initUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NavBarVC.hidesBottomBar(NO)
        self.loadDestinationSearchHot()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Custom Accessors （自定义访问器）
    func initUI(){
        self.dests.destinationHots = []
        self.view.backgroundColor = UIColor.clearColor()
        self.view.addSubview(topView)
        topView.title.text = "目的地"

        self.tableView.setSize(CGSizeMake(Screen_weight, Screen_height-NavBarH-StateBarH))
        self.tableView.setOrigin(CGPointMake(0, NavBarH+StateBarH))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(DestCell.self, forCellReuseIdentifier: identifier)
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: { 
            self.loadDestinationSearchHot()
        })
        self.tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
            self.loadDestinationSearchHot()
        })
        self.tableView.mj_header.automaticallyChangeAlpha = YES
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(self.tableView)
        
        let footerView:UIView = UIView.init(frame: CGRectMake(Screen_weight, 50, Screen_weight, TabBarH*1.5))
        footerView.backgroundColor = UIColor.whiteColor()
        self.tableView.tableFooterView = footerView

    }
    
    func loadDestinationSearchHot(){
        weak var weakSelf = self
        let parms:NSDictionary = ["key":"value"]
        getDestinationSearchHot(parms,
                                sucess: { (datas) in
                                    weakSelf!.tableView.mj_header.endRefreshing()
                                    weakSelf!.tableView.mj_footer.endRefreshing()
                                    if (!datas.isEqual(NSNull()) ) {
                                        guard let arr:NSArray = (datas as! NSArray) else {return}
                                        weakSelf!.dests.destinationHots = DestinationHot.parses(arr: arr) as? [DestinationHot]
                                        weakSelf!.tableView.reloadData()
                                        weakSelf!.tableView.hidden = NO
                                    }
            },
                                failure: { (errorMsg) in
                                    weakSelf!.tableView.mj_header.endRefreshing()
                                    weakSelf!.tableView.mj_footer.endRefreshing()
            }
        )
    }
    //MARK - UITableViewDataSource
    func tableView(tableViews: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return DestCellH
    }
    
    //总行数
    func tableView(tableViews: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (self.dests.destinationHots?.count)!
    }
    
    //加载数据
    func tableView(tableViews: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier);
        if(cell == nil){
            cell = DestCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier);
        }
        let cell0:DestCell = cell as! DestCell
        cell0.loadData(self.dests.destinationHots![indexPath.row])
        return cell0
        
    }
    
    //选择一行
    func tableView(tableViews: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    }
}

