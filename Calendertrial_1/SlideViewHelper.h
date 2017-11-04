//
//  SlideViewHelper.h
//  RNBlurredSideViewControllerExample
//
//  Created by zyc on 15/3/12.
//  Copyright (c) 2015年 Zzuumm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define DEFAULT_LEFT_WIDTH SCREEN_WIDTH-60
#define DEFAULT_RIGHT_WIDTH SCREEN_WIDTH-60
#define DEFAULT_ALPHA 0.5
#define DEFAULT_DIM_ALPHA 0.4



@interface SlideViewHelper : NSObject

@property(nonatomic,weak)UIViewController *vc;

//The width of the left side view. Set it to 0 if there is no left view.
@property (nonatomic, assign) CGFloat leftWidth;

//The width of the right side view. Set it to 0 if there is no right view.
@property (nonatomic, assign) CGFloat rightWidth;

//The container view of the right side view.
@property (nonatomic, retain) UIView *rightContentView;

//Dim the background when swiping. Default is YES.
@property (nonatomic, assign) BOOL dim;

@property(nonatomic,strong)NSMutableArray *chosenTags;
@property(strong,nonatomic)NSMutableArray *events;
@property(strong,nonatomic)NSArray *tags;


//The layer alpha of the side views.
@property (nonatomic, assign) CGFloat sideViewAlpha;

//The tint color of the side views.
@property (nonatomic, retain) UIColor *sideViewTintColor;

//The background image.
@property (nonatomic, retain) UIImage *backgroundImage;

//The container view of the center view.
@property (nonatomic, retain) UIView *centerContentView;




-(id)initWithUIViewController:(UIViewController *)vc;
-(void)ShowMoreTags;
-(void)goBack;

- (void)openLeftView:(BOOL)animated;
- (void)openRightView:(BOOL)animated;
- (void)closeSideView:(BOOL)animated;

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;


@end




@interface UIImage (RNBlurredSideViewController)

- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor;

@end

