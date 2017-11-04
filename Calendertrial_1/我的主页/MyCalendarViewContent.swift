//
//  MyCalendarViewContent.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/13.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MyCalendarViewContent: UIView {

    var listView = MCCListContent(frame: CGRectMake(0, 0, 0, 0));
    var calendarView = MCCCalenderContent(frame: CGRectMake(0, 0, 0, 0));
    var pullMessageView = MCCPullMessage(frame: CGRectMake(0, 0, 0, 0));
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame);
        MyInit();
    }
    
    func MyInit(){
        self.backgroundColor = UIColor.blueColor();
        
        listView = MCCListContent(frame: CGRectMake(0, 0, 0, 0));
        calendarView = MCCCalenderContent(frame: CGRectMake(0, 0, 0, 0));
        pullMessageView = MCCPullMessage(frame: CGRectMake(0, 0, 0, 0));

        self.addSubview(listView);
        self.addSubview(calendarView);
        self.addSubview(pullMessageView);
        
        listView.hidden = true;
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            pullMessageView.frame = CGRectMake(0, self.frame.height - pullMessageView.totalHeight, self.frame.width, pullMessageView.totalHeight);
            listView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height - pullMessageView.totalHeight);
            calendarView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height - pullMessageView.totalHeight);
        }
    }


}
