//
//  DateTakePreViewCell.swift
//  DateTaskPreView
//
//  Created by 璨 杨 on 15/3/18.
//  Copyright (c) 2015年 Gibbs. All rights reserved.
//

import UIKit

class DateTaskPreViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    @IBOutlet var DateLabel:UILabel!;
    @IBOutlet var HeadImage:UIImageView!;
    @IBOutlet var NameLabel:UILabel!;
    @IBOutlet var LastUpdateLabel:UILabel!;
    @IBOutlet var TaskLabelOne:UILabel!;
    @IBOutlet var TaskLabelTwo:UILabel!;
    @IBOutlet var TaskLabelThree:UILabel!;
    @IBOutlet var TaskLabelFour:UILabel!;
    @IBOutlet var CommentButton:UIButton!;
    @IBOutlet var LikeCountLabel:UILabel!;
    @IBOutlet var CommentNameOne:UILabel!;
    @IBOutlet var CommentOne:UILabel!;
    @IBOutlet var CommentImageViewOne:UIImageView!;
    @IBOutlet var CommentNameTwo:UILabel!;
    @IBOutlet var CommentTwo:UILabel!;
    @IBOutlet var CommentImageViewTwo:UIImageView!;
    @IBOutlet var CommentNameThree:UILabel!;
    @IBOutlet var CommentThree:UILabel!;
    @IBOutlet var CommentImageViewThree:UIImageView!;

    var TaskLabels = [UILabel]();
    var CommentNames = [UILabel]();
    var Comments = [UILabel]();
    var CommentImages = [UIImageView]();
    
    func initControl(userTasks:UserTasks){
        TaskLabels.append(self.TaskLabelOne);
        TaskLabels.append(self.TaskLabelTwo);
        TaskLabels.append(self.TaskLabelThree);
        TaskLabels.append(self.TaskLabelFour);
        
        CommentNames.append(self.CommentNameOne);
        CommentNames.append(self.CommentNameTwo);
        CommentNames.append(self.CommentNameThree);
        
        Comments.append(self.CommentOne);
        Comments.append(self.CommentTwo);
        Comments.append(self.CommentThree);
        
        CommentImages.append(self.CommentImageViewOne);
        CommentImages.append(self.CommentImageViewTwo);
        CommentImages.append(self.CommentImageViewThree);
        
        var dateFormat = NSDateFormatter();
        dateFormat.dateFormat = "dd";
        DateLabel.text = dateFormat.stringFromDate(userTasks.Date);
        HeadImage.image = userTasks.HeadImage;
        NameLabel.text = userTasks.Name;
        LastUpdateLabel.text = dateFormat.stringFromDate(userTasks.LastUpdate) + " 以前";
        for i in 1...userTasks.Tasks.count{
            TaskLabels[i - 1].hidden = false;
            TaskLabels[i - 1].text = userTasks.Tasks[i - 1];
        }
        var i = 0;
        for (name, comment) in userTasks.Comments{
            Comments[i].hidden = false;
            Comments[i].text = comment;
            
            CommentNames[i].hidden = false;
            CommentNames[i].text = name;
            
            CommentImages[i].hidden = false;
            i++;
        }
        LikeCountLabel.text = String(userTasks.LikeCount);
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.backgroundColor = UIColor.redColor();
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
