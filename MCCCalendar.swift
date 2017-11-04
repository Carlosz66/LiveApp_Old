//
//  MCCCalendar.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/15.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MCCCalendar: UIView {

    var headerCells = [MCCCalendarHeaderCell]();
    var taskCells  = [MCCCalendarTaskCell]();
    
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

        //Sun to Sat
        var headerCellColor = [UIColor.redColor(),UIColor.orangeColor(),UIColor.yellowColor(),UIColor.greenColor(),UIColor.blueColor(),UIColor.purpleColor(),UIColor.blackColor()];
        var headerCellText = ["Mon","Tue","Wed","Thur","Fri","Sat","Sun"];
        
        for i in 1...7{
            var headerCell = MCCCalendarHeaderCell(frame: CGRectMake(0, 0, 21, 21));
            headerCell.setContent(headerCellColor[i - 1], text: headerCellText[i - 1]);
            headerCells.append(headerCell);
            self.addSubview(headerCell);
        }
        //Load Data
        //Max 31
        for i in 1...31{
            var taskCell = MCCCalendarTaskCell(frame: CGRectMake(21, 21, 42, 42));
            
            /*
            //Add Data
            //
            //nothing
            */
            
            taskCells.append(taskCell);
            self.addSubview(taskCell);
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superView = self.superview{
            var headerCellWidth = self.frame.width / 7;
            var headerCellPosition:CGFloat = 0;
            for headerCell in headerCells{
                headerCell.frame = CGRectMake(headerCellPosition, 0, headerCellWidth, 21);
                headerCellPosition += headerCellWidth;
            }
            
            var cellHeight = (self.frame.height - 21) / 5;
            var row:CGFloat = 0;
            var col:CGFloat = 0;
            var cellX:CGFloat = 0;
            var cellY:CGFloat = 21;
            for cell in taskCells{
                cell.frame = CGRectMake(cellX, cellY, headerCellWidth, cellHeight);
                col++;
                if col == 7{
                    row++;
                    col = 0;
                }
                cellX = col * headerCellWidth;
                cellY = row * cellHeight + 21;
            }
        }
    }
}
