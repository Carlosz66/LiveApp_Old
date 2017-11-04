//
//  moreTagsOfRightContentView.m
//  RNBlurredSideViewControllerExample
//
//  Created by zyc on 15/3/14.
//  Copyright (c) 2015年 Zzuumm. All rights reserved.
//

#import "moreTagsOfRightContentView.h"

@implementation moreTagsOfRightContentView
- (IBAction)backToRightContentVIew:(UIButton *)sender
{
    [self.delegate goBack];
}

- (IBAction)choseTag:(UIButton *)sender
{
    if([sender isSelected]){
        [sender setSelected:NO];
        [self.delegate.chosenTags removeObject:sender.titleLabel.text];
    }else{
        [sender setSelected:YES];
        [self.delegate.chosenTags addObject:sender.titleLabel.text];
    }
}

-(void)drawButton
{
    int i=0;

    NSString *tagName;
    for (UIButton *tag in self.tags) {
        if(i<[self.delegate.tags count]){
            tagName=[self.delegate.tags objectAtIndex:i];
            if (tagName) {
                [tag setTitle:tagName forState:UIControlStateNormal];
                [tag setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                i++;
            }
        }else{
            tag.hidden=YES;
        }
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawButton];
}


@end
