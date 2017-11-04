//
//  MessageUIViewController.h
//  Calendertrial_1
//
//  Created by zyc on 15/1/30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageUIViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property(nonatomic)NSArray* list;//存@你的
@property(nonatomic)NSArray* list1;//存消息
@property(nonatomic)NSArray* list2;//存朋友



@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItemHead;

-(void)segmentAction:(UISegmentedControl *)Seg;
- (IBAction) onClickButtonAtIndexPath:(id) sender;
@end
