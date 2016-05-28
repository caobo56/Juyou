//
//  HomeDetailViewController.swift
//  JuYou
//
//  Created by caobo56 on 16/5/23.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit
import MJRefresh

class HomeDetailViewController: BasicViewController,UITableViewDelegate,UITableViewDataSource  {
    //MARK: - property 属性
    var freedomDetail:FreedomDetail = FreedomDetail.init()
    var freedomDetailID:String = ""
    var topView:JYHomeHeadView = JYHomeHeadView.init(frame: CGRectZero)
    var headView:HomeDetailHeadView = HomeDetailHeadView.init(frame:CGRectZero)
    var footView:HomeDetailFootView = HomeDetailFootView.init(frame: CGRectZero)
    
    var detailTableView = UITableView.init()
    let identifier = "detailCell"
    
    //MARK: - View Lifecycle （View 的生命周期）
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.initUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadWebData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        self.loadWebData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Custom Accessors （自定义访问器）
    func initUI(){
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topView)
        topView.title.text = "行程详情"
        topView.backBtn.addTarget(self, action:#selector(backBtnPress), forControlEvents: UIControlEvents.TouchUpInside)
        topView.backBtn.hidden = NO
        
        self.view.backgroundColor = UIColor.grayColor()
        
        self.detailTableView.setSize(CGSizeMake(Screen_weight, Screen_height-NavBarH-StateBarH))
        self.detailTableView.setOrigin(CGPointMake(0, NavBarH+StateBarH))
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.registerClass(DestCell.self, forCellReuseIdentifier: identifier)
        self.detailTableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.loadWebData()
        })
        self.detailTableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
            self.loadWebData()
        })
        self.detailTableView.tableHeaderView = headView
        self.detailTableView.tableFooterView = footView
        self.detailTableView.mj_header.automaticallyChangeAlpha = yes
        self.detailTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(self.detailTableView)
        
 
        
    }
    //加载数据
    func loadWebData(){
        weak var weakSelf = self
        let parmas:NSDictionary = ["id":freedomDetailID]
        JYAPIClient.searchFreedomById(parmas,sucess:{ (datas) in
            weakSelf!.detailTableView.mj_header.endRefreshing()
            weakSelf!.detailTableView.mj_footer.endRefreshing()
            if (!datas.isEqual(NSNull()) ) {
                print(datas)
                guard let dicts:NSDictionary = (datas as! NSDictionary) else {return}
                weakSelf!.freedomDetail = FreedomDetail.parse(dict:dicts)
                weakSelf?.laodData()
            }
            },failure: { (errorMsg) in
                weakSelf!.detailTableView.mj_header.endRefreshing()
                weakSelf!.detailTableView.mj_footer.endRefreshing()
        })
    }
    
    func laodData() {
       headView.loadData(self.freedomDetail)
       footView.loadData(self.freedomDetail)
       self.detailTableView.tableHeaderView = headView
       self.detailTableView.tableFooterView = footView
       self.detailTableView.reloadData()
    }
    
    func backBtnPress() {
        self.navigationController?.popViewControllerAnimated(yes)
    }
    
    //MARK - UITableViewDataSource
    func tableView(tableViews: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    //总行数
    func tableView(tableViews: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    //加载数据
    func tableView(tableViews: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableViews.dequeueReusableCellWithIdentifier(identifier);
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier);
        }
        cell?.textLabel?.text = "列表"
        return cell!
    }
    
    //选择一行
    func tableView(tableViews: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    }

}
