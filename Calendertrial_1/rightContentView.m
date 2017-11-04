//
//  TableViewCell.m
//  RNBlurredSideViewControllerExample
//
//  Created by zyc on 15/3/12.
//  Copyright (c) 2015年 Zzuumm. All rights reserved.
//

#import "rightContentView.h"

@implementation rightContentView

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)tag1:(UIButton *)sender
{
    if([sender isSelected]){
        [sender setSelected:NO];
        [self.delegate.chosenTags removeObject:sender.titleLabel.text];
    }else{
        [sender setSelected:YES];
        [self.delegate.chosenTags addObject:sender.titleLabel.text];
    }
    
}

- (IBAction)moreTags:(UIButton *)sender
{
    [self.delegate ShowMoreTags];
    NSLog(@"showMoreTags");
}



@end
