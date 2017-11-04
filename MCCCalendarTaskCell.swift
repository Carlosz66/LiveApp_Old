//
//  MCCCalendarTaskCell.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/16.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MCCCalendarTaskCell: UIView {

    var backgroundImageView = UIImageView();
    var dateLabel = UILabel();
    var taskLabels = [UILabel]();
    
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
        self.backgroundColor = UIColor.grayColor();
        
        backgroundImageView = UIImageView(image: UIImage(named: "TaskCellBackground"));
        backgroundImageView.frame = CGRectMake(0, 0, 100, 100);
        self.addSubview(backgroundImageView);
        
        dateLabel = UILabel();
        dateLabel.font = UIFont(name: "Helvetica", size: 10);
        dateLabel.text = "某一天";
        dateLabel.sizeToFit();
        dateLabel.backgroundColor = UIColor.redColor();
        self.addSubview(dateLabel);
        
        for i in 0...2{
            var taskLabel = UILabel(frame: CGRectMake(2, 2, 21, 21));
            taskLabel.backgroundColor = UIColor.blueColor();
            taskLabels.append(taskLabel);
            self.addSubview(taskLabel);
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            backgroundImageView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height);
            
            dateLabel.frame = CGRectMake(2, 2, dateLabel.frame.width, dateLabel.frame.height);
            
            var taskLabelY:CGFloat = dateLabel.frame.height + 6;
            var taskLabelHeight:CGFloat = (self.frame.height - dateLabel.frame.height - 8) / 3;
            for taskLabel in taskLabels{
                taskLabel.frame = CGRectMake(4, taskLabelY + 2, self.frame.width - 8, 4);
                taskLabelY += taskLabelHeight;
            }
        }
    }


}
