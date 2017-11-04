//
//  TableViewCell.h
//  RNBlurredSideViewControllerExample
//
//  Created by zyc on 15/3/12.
//  Copyright (c) 2015年 Zzuumm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SlideViewHelper.h"

@class SlideViewHelper;

@interface rightContentView : UIView

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tags;
@property (weak, nonatomic) IBOutlet UITableView *eventTable;

@property(assign,nonatomic)SlideViewHelper *delegate;


@end
