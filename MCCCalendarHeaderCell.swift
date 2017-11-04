//
//  MCCCalendarHeaderCell.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/16.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MCCCalendarHeaderCell: UIView {

    var dayLabel = UILabel();
    
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
        self.backgroundColor = UIColor.brownColor();
        
        dayLabel = UILabel();
        
        self.addSubview(dayLabel);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            dayLabel.frame = CGRectMake(0, 0, self.frame.width, self.frame.height);
        }
    }

    func setContent(color: UIColor, text:String){
        dayLabel.backgroundColor = color;
        dayLabel.text = text;
    }

}
