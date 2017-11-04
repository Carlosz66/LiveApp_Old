//
//  MyTableViewController1.h
//  Calendertrial_1
//
//  Created by zyc on 15/1/29.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewController1 : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray* sections;
@property(nonatomic,strong)NSArray* contentOfSection;
@property(nonatomic)BOOL notificationSwitch;
@property(nonatomic)BOOL passwordSwitch;

@property (strong, nonatomic) IBOutlet UITableView *tableview;

- (IBAction) updateSwitchAtIndexPath:(id) sender;
@end
