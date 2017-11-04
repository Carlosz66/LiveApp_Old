
//
//  UserInfo.swift
//  DateTaskPreView
//
//  Created by 璨 杨 on 15/3/18.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import Foundation
import UIKit

class UserTasks{
    //Load From Web
    var Date:NSDate;
    var HeadImage:UIImage;
    var Name:String;
    var LastUpdate:NSDate;
    //Max 4
    var Tasks:[String];
    var LikeCount:Int32;
    //Max 3
    var Comments:Dictionary<String,String>;
    
    init(Date:NSDate, HeadImage:UIImage, Name:String, LastUpdate:NSDate, Tasks:[String], LikeCount:Int32, Comments:Dictionary<String,String>){
        self.Date = Date;
        self.HeadImage = HeadImage;
        self.Name = Name;
        self.LastUpdate = LastUpdate;
        self.Tasks = Tasks;
        self.LikeCount = LikeCount;
        self.Comments = Comments;
    }
}