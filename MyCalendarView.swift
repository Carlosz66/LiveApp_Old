//
//  MyCalendarView.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/13.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

@objc class MyCalendarView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var headerView = MyCalendarViewHeader(frame: CGRectMake(0, 0, 0, 0), myMaskView: UIView());
    var contentView = MyCalendarViewContent(frame: CGRectMake(0, 0, 0, 0));
    var tabView = MyCalendarViewTab(frame: CGRectMake(0, 0, 0, 0),  contentView: MyCalendarViewContent(frame: CGRectMake(0, 0, 0, 0)));
    
    var myMaskView = UIView();

    override init(frame: CGRect) {
        super.init(frame: frame);
        myinit();
    }
    
    func myinit(){
        self.backgroundColor = UIColor.purpleColor();
        
        self.myMaskView = UIView();
        self.headerView = MyCalendarViewHeader(frame: CGRectMake(0, 0, 0, 0), myMaskView: self.myMaskView);
        self.contentView = MyCalendarViewContent(frame: CGRectMake(0, 0, 0, 0));
        self.tabView = MyCalendarViewTab(frame: CGRectMake(0, 0, 0, 0), contentView: contentView);
        
        self.addSubview(headerView);
        self.addSubview(tabView);
        self.addSubview(contentView);
        self.addSubview(myMaskView);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superview = self.superview{
            self.frame = CGRectMake(0,0, self.superview!.frame.width, self.superview!.frame.height);
            myMaskView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height);
            headerView.frame = CGRectMake(0, 0, self.frame.width, headerView.totalHeight);
            tabView.frame = CGRectMake(0, headerView.totalHeight, self.frame.width, tabView.totalHeight);
            contentView.frame = CGRectMake(0, headerView.totalHeight + tabView.totalHeight, self.frame.width, self.frame.height - headerView.totalHeight - tabView.totalHeight);
        }
    }
}
