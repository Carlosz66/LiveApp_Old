//
//  MCCListContent.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/15.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

@objc class MCCListContent: UIView,UITableViewDataSource {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    var userTasks = [UserTasks]();
    var tableView = UITableView();

    override init(frame: CGRect) {
        super.init(frame: frame);
        MyInit();
    }
    
    func MyInit(){
        self.backgroundColor = UIColor.greenColor();
        
        //Load Date From Web
        var Date = NSDate();
        var HeadImage = UIImage(named: "HeadImage");
        var Name = "Gibbs";
        var LastUpdate = NSDate();
        //Max 4
        var Tasks = [String]();
        Tasks.append("AM9-10 吃饭");
        Tasks.append("AM11-12 睡觉");
        Tasks.append("...设计费拉进来腹肌啊六十多家发垃圾费拉设计费拉丝机地方啦司法局.");
        var LikeCount:Int32 = 99;
        //Max 3
        var Comments = Dictionary<String,String>();
        Comments.updateValue("Shall i go with you", forKey: "lala");
        Comments.updateValue("超级无敌啊见识到了腹肌啊洛杉矶的法律设计费拉三家分店", forKey: "小恩恩");
        
        userTasks = [UserTasks]();
        
        for i in 0...4{
            userTasks.append(UserTasks(Date: Date, HeadImage: HeadImage!, Name: Name, LastUpdate: LastUpdate, Tasks: Tasks, LikeCount: LikeCount, Comments: Comments));
        }
        
        //Load end
        tableView = UITableView(frame: self.frame);
        tableView.dataSource = self;
        tableView.allowsSelection = false;
        let nibName = UINib(nibName: "DateTaskPreViewCell", bundle:nil)
        tableView.registerNib(nibName, forCellReuseIdentifier: "Cell");
        self.addSubview(tableView);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            self.tableView.frame = self.frame;
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DateTaskPreViewCell;
        
        //cell.titleLabel.text = "\(ListArray.objectAtIndex(indexPath.item))"
        
        //cell.labelTitle.text = "\(ListArray.objectAtIndex(indexPath.row))"
        
        //return cell
        
        //var cell:DateTaskPreViewCell = NSBundle.mainBundle().loadNibNamed("DateTaskPreViewCell", owner: self, options: nil).first as DateTaskPreViewCell;
        cell.initControl(userTasks[indexPath.row]);
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTasks.count;
    }

}
