//
//  FirstViewController.swift
//  JuYou
//
//  Created by caobo56 on 16/5/16.
//  Copyright © 2016年 caobo56. All rights reserved.
//

import UIKit
import MJRefresh

let IsHotsCellW=Screen_weight
let IsHotsCellH=(Screen_weight/690*360+62)

class HomeViewController: BasicViewController,UITableViewDelegate,UITableViewDataSource{
    //MARK: - property 属性
    var categorys:FilterFreedoms = FilterFreedoms.init()
    var isHots:FilterFreedoms = FilterFreedoms.init()
    
    var topView:JYHomeHeadView = JYHomeHeadView.init(frame: CGRectZero)
    
    var tableView:UITableView = UITableView.init()
    let identifier = "IsHotCell";
    
    var headView:ISHotHeadView = ISHotHeadView.init(frame: CGRectZero)

    //MARK: - View Lifecycle （View 的生命周期）
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NavBarVC.hidesBottomBar(NO)
        self.loadWebData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Custom Accessors （自定义访问器）
    func initUI(){
        self.categorys.filterFreedoms = []
        self.isHots.filterFreedoms = []
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topView)
        topView.title.text = "首页"
        self.tableView.setSize(CGSizeMake(Screen_weight, Screen_height-NavBarH-StateBarH))
        self.tableView.setOrigin(CGPointMake(0, NavBarH+StateBarH))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(IsHotCell.self, forCellReuseIdentifier: identifier)
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.loadWebData()
        })
        self.tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
            self.loadWebData()
        })
        self.tableView.mj_header.automaticallyChangeAlpha = YES
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(self.tableView)
        self.tableView.tableHeaderView = self.headView
        
        let footerView:UIView = UIView.init(frame: CGRectMake(Screen_weight, 50, Screen_weight, TabBarH*1.5))
        footerView.backgroundColor = UIColor.whiteColor()
        self.tableView.tableFooterView = footerView
    }
    
    //加载数据
    func loadWebData(){

        weak var weakSelf = self
        let parmasCategory:NSDictionary = ["freedom.category":"1","freedom.orderBy":"0","pager.pageNum":"0","pager.pageSize":"2"]
        getFilterFreedom(parmasCategory,sucess:{ (datas) in
            weakSelf!.tableView.mj_header.endRefreshing()
            weakSelf!.tableView.mj_footer.endRefreshing()
            if (!datas.isEqual(NSNull()) ) {
                guard let arrs:NSArray = (datas as! NSArray) else {return}
                weakSelf!.categorys.filterFreedoms = Filterfreedom.parses(arr: arrs) as? [Filterfreedom]
                weakSelf!.headView.loadData((weakSelf?.categorys.filterFreedoms)!)
                weakSelf?.tableView.reloadData()
            }
            },failure: { (errorMsg) in
                weakSelf!.tableView.mj_header.endRefreshing()
                weakSelf!.tableView.mj_footer.endRefreshing()
        })
        let parmasIsHot:NSDictionary = ["freedom.isHot":"1","freedom.orderBy":"0","pager.pageNum":"0","pager.pageSize":"5"]
        getFilterFreedom(parmasIsHot,sucess:{ (datas) in
            weakSelf!.tableView.mj_header.endRefreshing()
            weakSelf!.tableView.mj_footer.endRefreshing()
            if (!datas.isEqual(NSNull()) ) {
                guard let arrs:NSArray = (datas as! NSArray) else {return}
                weakSelf!.isHots.filterFreedoms = Filterfreedom.parses(arr: arrs) as? [Filterfreedom]
                weakSelf?.tableView.reloadData()
            }
            },failure: { (errorMsg) in
            weakSelf!.tableView.mj_header.endRefreshing()
            weakSelf!.tableView.mj_footer.endRefreshing()
        })
    }
    
    //MARK - UITableViewDataSource
    func tableView(tableViews: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return IsHotsCellH
    }
    
    //总行数
    func tableView(tableViews: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (self.isHots.filterFreedoms?.count)!
    }
    
    //加载数据
    func tableView(tableViews: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier);
        if(cell == nil){
            cell = IsHotCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier);
        }
        let cell0:IsHotCell = cell as! IsHotCell
        cell0.loadData(self.isHots.filterFreedoms![indexPath.row])
        return cell0
    }
    
    //选择一行
    func tableView(tableViews: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let detail:HomeDetailViewController = HomeDetailViewController.init()
        self.navigationController?.pushViewController(detail, animated: YES)
    }

}

