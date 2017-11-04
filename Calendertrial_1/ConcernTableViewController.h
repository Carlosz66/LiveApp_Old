//
//  ConcernTableViewController.h
//  Calendertrial_1
//
//  Created by zyc on 15/1/30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConcernTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property(nonatomic) NSArray* list;
@property (weak, nonatomic) IBOutlet UINavigationItem *headLable;

- (IBAction) onClickButtonAtIndexPath:(id) sender;
@end
