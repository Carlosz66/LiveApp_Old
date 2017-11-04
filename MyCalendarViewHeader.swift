//
//  MyCalendarViewHeader.swift
//  CalendarView
//
//  Created by 璨 杨 on 15/3/13.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class MyCalendarViewHeader: UIView {

    var totalHeight:CGFloat = 0;
    
    var headImage = UIImage();
    var headImageView = UIImageView();
    var settingImage = UIImage();
    var settingImageView = UIImageView();
    var followerLabel = UILabel();
    var followingLabel = UILabel();
    var signLabel = UILabel();
    
    var myMaskView = UIView();
    var importImageView = UIImageView();
    var uploadPhotoImageView = UIImageView();
    var takePhotoImageView = UIImageView();
    var deleteImageView = UIImageView();
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
        
    init(frame: CGRect, myMaskView:UIView) {
        super.init(frame: frame);
        self.myMaskView = myMaskView;
        MyInit();
    }
    
    func MyInit(){
        self.backgroundColor = UIColor.yellowColor();
        
        headImage = UIImage(named: "head")!;
        headImageView = UIImageView(image: headImage);
        headImageView.frame = CGRectMake(0, 0, 60, 60);
        headImageView.userInteractionEnabled = true;
        var clickevent = UITapGestureRecognizer(target: self, action: "click");
        headImageView.addGestureRecognizer(clickevent);
        self.addSubview(headImageView);
        
        settingImage = UIImage(named: "setting")!;
        settingImageView = UIImageView(image: settingImage);
        settingImageView.frame = CGRectMake(0, 0, 20, 20);
        self.addSubview(settingImageView);
        
        followerLabel = UILabel(frame: CGRectMake(0, 0, 21, 21));
        followerLabel.font = UIFont(name: "Helvetica-Bold", size: 10);
        followerLabel.text = "1 关注者";
        followerLabel.textAlignment = NSTextAlignment.Center;
        followerLabel.backgroundColor = UIColor.redColor();
        followerLabel.sizeToFit();
        self.addSubview(followerLabel);
        
        followingLabel = UILabel(frame: CGRectMake(0, 0, 21, 21));
        followingLabel.font = UIFont(name: "Helvetica-Bold", size: 10);
        followingLabel.text = "0 关注";
        followingLabel.textAlignment = NSTextAlignment.Center;
        followingLabel.backgroundColor = UIColor.greenColor();
        followingLabel.sizeToFit();
        self.addSubview(followingLabel);
        signLabel = UILabel(frame: CGRectMake(0, 0, 21, 21));
        signLabel.font = UIFont(name: "Helvetica", size: 12);
        signLabel.text = "45度角明媚的忧伤";
        signLabel.textAlignment = NSTextAlignment.Center;
        signLabel.backgroundColor = UIColor.brownColor();
        signLabel.textColor = UIColor.whiteColor();
        signLabel.sizeToFit();
        self.addSubview(signLabel);
        
        //myMaskView = UIView();
        myMaskView.userInteractionEnabled = true;
        var maskclickevent = UITapGestureRecognizer(target: self, action: "clicktohidden");
        myMaskView.addGestureRecognizer(maskclickevent);
        myMaskView.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5);
        myMaskView.hidden = true;
        //self.addSubview(myMaskView);
        
        importImageView = UIImageView(image: UIImage(named: "ImportButton"));
        myMaskView.addSubview(importImageView);
        
        uploadPhotoImageView = UIImageView(image: UIImage(named: "UploadPhotoButton"));
        myMaskView.addSubview(uploadPhotoImageView);
        
        takePhotoImageView = UIImageView(image: UIImage(named: "TakePhotoButton"));
        myMaskView.addSubview(takePhotoImageView);
        
        deleteImageView = UIImageView(image: UIImage(named: "DeleteButton"));
        myMaskView.addSubview(deleteImageView);

        
        self.totalHeight = 2 + self.headImageView.frame.height + 2 + 21 + 2 + 21;
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        if let superview = self.superview{
            
            self.headImageView.frame.origin.x = self.frame.width / 2 - self.headImageView.frame.width / 2;
            self.headImageView.frame.origin.y = 2;
            
            self.settingImageView.frame.origin.x = self.frame.width / 4 * 3;
            self.settingImageView.center.y = self.headImageView.center.y;
            
            self.followerLabel.frame = CGRectMake(0, 2 + self.headImageView.frame.height + 2, self.frame.width / 2, 21);
            
            self.followingLabel.frame = CGRectMake(self.frame.width / 2, 2 + self.headImageView.frame.height + 2, self.frame.width / 2, 21);
            
            self.signLabel.frame = CGRectMake(0, 2 + self.headImageView.frame.height + 2 + self.followerLabel.frame.height + 2, self.frame.width, 21);
            
            var sin225:CGFloat = sin(22.5 * 3.14 / 180);
            var sin675:CGFloat = sin(67.5 * 3.14 / 180);
            var cos225:CGFloat = cos(22.5 * 3.14 / 180);
            var cos675:CGFloat = cos(67.5 * 3.14 / 180);
            var r:CGFloat = (30 * sqrt(2)) / 2;
            var hypo:CGFloat = r + 80;
            var centerX = headImageView.frame.origin.x + headImageView.frame.width / 2;
            var centerY = headImageView.frame.origin.y + headImageView.frame.height / 2;
            
            self.importImageView.frame = CGRectMake(centerX - hypo * cos225, centerY + hypo * sin225, 45, 45);
            self.importImageView.center.x = centerX - hypo * cos225;
            self.importImageView.center.y = centerY + hypo * sin225;
            
            self.uploadPhotoImageView.frame = CGRectMake(centerX - hypo * cos675, centerY + hypo * sin675, 45, 45);
            self.uploadPhotoImageView.center.x = centerX - hypo * cos675;
            self.uploadPhotoImageView.center.y = centerY + hypo * sin675;
            
            self.takePhotoImageView.frame = CGRectMake(centerX + hypo * cos675, centerY + hypo * sin675, 45, 45);
            self.takePhotoImageView.center.x = centerX + hypo * cos675;
            self.takePhotoImageView.center.y = centerY + hypo * sin675;
            
            self.deleteImageView.frame = CGRectMake(centerX + hypo * cos225, centerY + hypo * sin225, 45, 45);
            self.deleteImageView.center.x = centerX + hypo * cos225;
            self.deleteImageView.center.y = centerY + hypo * sin225;
        }
    }
    
    func click(){
        myMaskView.hidden = false;
    }
    
    func clicktohidden(){
        myMaskView.hidden = true;
    }
}
