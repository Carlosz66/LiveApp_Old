//
//  moreTagsOfRightContentView.h
//  RNBlurredSideViewControllerExample
//
//  Created by zyc on 15/3/14.
//  Copyright (c) 2015年 Zzuumm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideViewHelper.h"


@interface moreTagsOfRightContentView : UIView

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tags;


@property(assign,nonatomic) SlideViewHelper *delegate;
@end
