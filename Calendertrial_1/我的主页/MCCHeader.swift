//
//  MCCHeader.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/15.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MCCHeader: UIView {

    var totalHeight:CGFloat = 0;
    
    var preMonthImageView = UIImageView();
    var nextMonthImageView = UIImageView();
    var dateLabel = UILabel();
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
        
        preMonthImageView = UIImageView(image: UIImage(named: "left"));
        preMonthImageView.frame = CGRectMake(0, 0, 42, 21);
        self.addSubview(preMonthImageView)
        
        nextMonthImageView = UIImageView(image: UIImage(named: "right"));
        nextMonthImageView.frame = CGRectMake(0, 0, 42, 21);
        self.addSubview(nextMonthImageView);
        
        dateLabel = UILabel(frame: CGRectMake(0, 0, 21, 21));
        dateLabel.text = "2012年5月2日";
        dateLabel.textAlignment = NSTextAlignment.Center;
        self.addSubview(dateLabel);
        
        self.totalHeight = 21 + 8 + 8;
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            preMonthImageView.frame = CGRectMake(8, 8, 42, 21);
            nextMonthImageView.frame = CGRectMake(self.frame.width - 42 - 8, 8, 42, 21);
            dateLabel.frame = CGRectMake(42, 8, self.frame.width - 42 - 42 - 8 - 8, 21);
        }
    }
}
