//
//  MCCCalenderContent.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/15.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MCCCalenderContent: UIView {

    var headerView = MCCHeader(frame: CGRectMake(0, 0, 100, 100));
    var calanderView = MCCCalendar(frame: CGRectMake(0, 0, 100, 100));
    
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
        self.backgroundColor = UIColor.yellowColor();
        
        headerView = MCCHeader(frame: CGRectMake(0, 0, 100, 200));
        calanderView = MCCCalendar(frame: CGRectMake(0, 0, 100, 100));
        
        self.addSubview(headerView);
        self.addSubview(calanderView);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            headerView.frame = CGRectMake(0, 0, self.frame.width, headerView.totalHeight);
            calanderView.frame = CGRectMake(0, headerView.totalHeight, self.frame.width, self.frame.height - headerView.totalHeight);
        }
    }

}
