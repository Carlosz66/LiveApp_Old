//
//  MCCPullMessage.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/15.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MCCPullMessage: UIView {

    var totalHeight:CGFloat = 0;
    
    var label = UILabel();
    
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
        
        label = UILabel();
        label.text = "今日星座：炒面座 今日运势：有点糊";
        label.textColor = UIColor.whiteColor();
        label.sizeToFit();
        self.addSubview(label);
        
        totalHeight = 100;
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            label.frame = CGRectMake(self.frame.width / 2 - label.frame.width / 2, self.frame.height / 2 - label.frame.height / 2, label.frame.width, label.frame.height);
        }
    }
}
