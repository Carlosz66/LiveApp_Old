//
//  MyCalendarViewTab.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/13.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MyCalendarViewTab: UIView {

    var totalHeight:CGFloat = 0;
    var calendarButton = UIButton();
    var listButton = UIButton();
    
    var contentView = MyCalendarViewContent(frame: CGRectMake(0, 0, 0, 0));
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
        
    init(frame: CGRect, contentView:MyCalendarViewContent) {
        super.init(frame: frame);
        self.contentView = contentView;
        MyInit();
    }
    
    func MyInit(){
        self.backgroundColor = UIColor.blueColor();
        
        calendarButton = UIButton();
        calendarButton.setTitle("日历", forState: UIControlState.Normal);
        calendarButton.addTarget(self, action: Selector("changeToCalendar"), forControlEvents: UIControlEvents.TouchUpInside);
        calendarButton.sizeToFit();
        calendarButton.backgroundColor = UIColor.blueColor();
        self.addSubview(calendarButton);
        
        listButton = UIButton();
        listButton .setTitle("列表", forState: UIControlState.Normal);
        listButton.addTarget(self, action: Selector("changeToList"), forControlEvents: UIControlEvents.TouchUpInside);
        listButton.sizeToFit();
        listButton.backgroundColor = UIColor.redColor();
        self.addSubview(listButton);
        
        totalHeight = calendarButton.frame.height;
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            calendarButton.frame = CGRectMake(0, 0, self.frame.width / 2, calendarButton.frame.height);
            listButton.frame = CGRectMake(self.frame.width / 2, 0, self.frame.width / 2, listButton.frame.height);
        }
    }
    
    func changeToCalendar(){
        self.contentView.listView.hidden = true;
        self.contentView.calendarView.hidden = false;
    }
    
    func changeToList(){
        self.contentView.listView.hidden = false;
        self.contentView.calendarView.hidden = true;

    }
}
