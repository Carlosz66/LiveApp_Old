//
//  MessageUIViewController.m
//  Calendertrial_1
//
//  Created by zyc on 15/1/30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "MessageUIViewController.h"

#define UNKOWN 0
#define ACCEPT 1
#define REFUSE 2
#define CONCERNED 1
#define UNCONCERN 0
@interface MessageUIViewController ()

@end

@implementation MessageUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableDictionary* cellContent=[[NSMutableDictionary alloc]init];
    NSString* path=[[NSBundle mainBundle]pathForResource:@"Photos" ofType:@"png"];
    [cellContent setObject:[UIImage imageWithContentsOfFile:path] forKey:@"clientImage"];
    NSString* title=[NSString stringWithFormat:@"%@ 对你 %@",@"Bobby",@"2015/01/18"];
    NSString* subTitle=[NSString stringWithFormat:@"%@ %@",@"AM8-9 *Brunch@Ruizi@Raymond",@"说赞"];
    [cellContent setObject:title forKey:@"clientWhoWhen"];
    [cellContent setObject:subTitle forKey:@"clientWhat"];//@你的cell数据样品
    
    self.list=[[NSArray alloc]initWithObjects:cellContent,nil];
    
    NSMutableDictionary* cellContent1=[[NSMutableDictionary alloc]init];
    NSString* path1=[[NSBundle mainBundle]pathForResource:@"Photos" ofType:@"png"];
    [cellContent1 setObject:[UIImage imageWithContentsOfFile:path1] forKey:@"clientImage"];
    NSString* title1=[NSString stringWithFormat:@"%@ 对你 %@",@"Carlos",@"2015/01/18"];
    NSString* subTitle1=[NSString stringWithFormat:@"%@ %@",@"AM8-9 *Brunch@Ruizi@Raymond",@"说赞"];
    [cellContent1 setObject:title1 forKey:@"clientWhoWhen"];
    [cellContent1 setObject:subTitle1 forKey:@"clientWhat"];
    NSNumber* state1=[NSNumber numberWithInt:(int)UNKOWN];
    [cellContent1 setObject:state1 forKey:@"clientRespondState"];//消息的数据样品
    self.list1=[[NSArray alloc]initWithObjects:cellContent1, nil];
    
    NSMutableDictionary* cellContent2=[[NSMutableDictionary alloc]init];
    NSString* path2=[[NSBundle mainBundle]pathForResource:@"Photos" ofType:@"png"];
    [cellContent2 setObject:[UIImage imageWithContentsOfFile:path2] forKey:@"clientImage"];
    NSString* title2=[NSString stringWithFormat:@"%@ %@ %@",@"Raymond",@"刚刚",@"关注了你"];
    NSNumber* state2=[NSNumber numberWithInt:UNCONCERN];
    [cellContent2 setObject:title2 forKey:@"clientWhoWhen"];
    [cellContent2 setObject:state2 forKey:@"clientState"];//朋友的数据样品
    self.list2=[[NSArray alloc]initWithObjects:cellContent2, nil];
    
    
    /*NSArray *segmentedArray = [[NSArrayalloc]initWithObjects:@"1",@"2",@"3",@"4",nil];
    
    //初始化UISegmentedControl
    
    UISegmentedControl *segmentedControl = [[UISegmentedControlalloc]initWithItems:segmentedArray];
     */
    [_navigationItemHead setTitle:@"个人动态"];
    self.segment.momentary = NO;
    _segment.selectedSegmentIndex = 0;
    [_segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* identity=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identity];
    }
    if (self.segment.selectedSegmentIndex==0) {
        NSDictionary* cellContent=[_list objectAtIndex:indexPath.row];
        cell.imageView.image=[cellContent objectForKey:@"clientImage"];
        cell.textLabel.text=[cellContent objectForKey:@"clientWhoWhen"];
        cell.detailTextLabel.text=[cellContent objectForKey:@"clientWhat"];
        
        UIButton* concernedButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        concernedButton.frame=CGRectMake(0, 0, 50, 30);
        [concernedButton setBackgroundColor:[UIColor whiteColor]];
        cell.accessoryView=concernedButton;
        NSLog(@"hello world");
    }
    
    else if(self.segment.selectedSegmentIndex==1){
        NSDictionary* cellContent=[_list1 objectAtIndex:indexPath.row];
        cell.imageView.image=[cellContent objectForKey:@"clientImage"];
        cell.textLabel.text=[cellContent objectForKey:@"clientWhoWhen"];
        cell.detailTextLabel.text=[cellContent objectForKey:@"clientWhat"];
        
        UIButton* concernedButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        concernedButton.frame=CGRectMake(0, 0, 50, 30);
        [concernedButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [concernedButton.layer setMasksToBounds:YES];//设置圆角矩形
        [concernedButton.layer setCornerRadius:10.0];
        [concernedButton addTarget:self action:@selector(onClickButtonAtIndexPath:) forControlEvents:UIControlEventTouchUpInside];
        
        if([[cellContent objectForKey:@"clientRespondState"] isEqualToNumber:[NSNumber numberWithInt:UNKOWN] ]){
            [concernedButton setTitle: @"回应"forState:UIControlStateNormal] ;
            [concernedButton setBackgroundColor:[UIColor blueColor]];
        }else if([[cellContent objectForKey:@"clientRespondState"] isEqualToNumber:[NSNumber numberWithInt:ACCEPT] ]){
            [concernedButton setTitle: @"已接受"forState:UIControlStateNormal] ;
            [concernedButton setBackgroundColor:[UIColor greenColor]];
        }else if([[cellContent objectForKey:@"clientRespondState"] isEqualToNumber:[NSNumber numberWithInt:REFUSE] ]){
            [concernedButton setTitle: @"已拒绝"forState:UIControlStateNormal] ;
            [concernedButton setBackgroundColor:[UIColor redColor]];
        }
        cell.accessoryView=concernedButton;
        concernedButton.tag=indexPath.row;
        
        NSLog(@"hello world");

    }
    
    
    else if(self.segment.selectedSegmentIndex==2){
        NSDictionary* cellContent=[_list2 objectAtIndex:indexPath.row];
        cell.imageView.image=[cellContent objectForKey:@"clientImage"];
        cell.textLabel.text=[cellContent objectForKey:@"clientWhoWhen"];
        cell.detailTextLabel.text=@"";
        
        UIButton* concernedButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        concernedButton.frame=CGRectMake(0, 0, 50, 30);
        [concernedButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [concernedButton.layer setMasksToBounds:YES];//设置圆角矩形
        [concernedButton.layer setCornerRadius:10.0];
        [concernedButton addTarget:self action:@selector(onClickButtonAtIndexPath:) forControlEvents:UIControlEventTouchUpInside];
        if([[cellContent objectForKey:@"clientState"] isEqualToNumber:[NSNumber numberWithInt:CONCERNED]]){//已关注
            [concernedButton setTitle: @"已关注"forState:UIControlStateNormal] ;
            [concernedButton setBackgroundColor:[UIColor redColor]];
        }else{
            [concernedButton setTitle: @"＋关注"forState:UIControlStateNormal] ;
            [concernedButton setBackgroundColor:[UIColor greenColor]];
        }
        NSLog(@"hello world");
        cell.accessoryView=concernedButton;
        concernedButton.tag=indexPath.row;
    }
    return cell;
}

- (IBAction) onClickButtonAtIndexPath:(id) sender{
    UIView* onClickImage=sender;
    if (self.segment.selectedSegmentIndex==1) {
        if([[[_list1 objectAtIndex:onClickImage.tag]objectForKey:@"clientRespondState"]isEqualToNumber:[NSNumber numberWithInt:UNKOWN]]){
            UIAlertView* chooseView=[[UIAlertView alloc]initWithTitle:@"如何抉择" message:@""delegate:self cancelButtonTitle:@"残忍拒绝" otherButtonTitles:@"欣然答应", @"取消",nil];
            chooseView.tag=onClickImage.tag;
            [chooseView show];
        }
    }
    else if(self.segment.selectedSegmentIndex==2){
        if ([[[_list2 objectAtIndex:onClickImage.tag]objectForKey:@"clientState"]isEqualToNumber:[NSNumber numberWithInt:CONCERNED]]) {
            UIAlertView* chooseView=[[UIAlertView alloc]initWithTitle:@"是否取消关注" message:@""delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
            chooseView.tag=onClickImage.tag;
            [chooseView show];
        }else{
            UIAlertView* chooseView=[[UIAlertView alloc]initWithTitle:@"是否加关注" message:@""delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
            chooseView.tag=onClickImage.tag;
            [chooseView show];
        }
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.segment.selectedSegmentIndex==1){
        if(buttonIndex==0){
            NSMutableDictionary* clientInformation=[_list1 objectAtIndex:alertView.tag];
            [clientInformation setObject:[NSNumber numberWithInt:REFUSE] forKey:@"clientRespondState"];
        }
        else if(buttonIndex==1) {
            NSMutableDictionary* clientInformation=[_list1 objectAtIndex:alertView.tag];
            [clientInformation setObject:[NSNumber numberWithInt:ACCEPT] forKey:@"clientRespondState"];
        }
    }
    else if(self.segment.selectedSegmentIndex==2){
        if (buttonIndex==1) {
            NSMutableDictionary* clientInformation=[_list2 objectAtIndex:alertView.tag];
            if([[clientInformation objectForKey:@"clientState"]isEqualToNumber:[NSNumber numberWithInt:CONCERNED]]){
                [clientInformation setObject:[NSNumber numberWithInt:UNCONCERN] forKey:@"clientState"];
            }else{
                [clientInformation setObject:[NSNumber numberWithInt:CONCERNED]forKey:@"clientState"];
            }
        }
    }
}

-(void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    
    NSLog(@"Index %i", Index);
    
    switch (Index) {
            
        case 0:
            [_tableView reloadData];
            break;
            
        case 1:
            [_tableView reloadData];

            
            break;
            
        case 2:
            [_tableView reloadData];

            
            break;
            
        default:
            
            break;
            
    }
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self.tableView reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
