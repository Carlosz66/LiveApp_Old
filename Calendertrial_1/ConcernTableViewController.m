//
//  ConcernTableViewController.m
//  Calendertrial_1
//
//  Created by zyc on 15/1/30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//
#define CONCERNED 1
#define UNCONCERN 0

#import "ConcernTableViewController.h"

@interface ConcernTableViewController ()

@end

@implementation ConcernTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary* cellContent=[[NSMutableDictionary alloc]init];
    NSString* path=[[NSBundle mainBundle]pathForResource:@"Photos" ofType:@"png"];
    [cellContent setObject:[UIImage imageWithContentsOfFile:path] forKey:@"clientImage"];
    [cellContent setObject:@"Raymond" forKey:@"clientName"];
    [cellContent setObject:@"我们手握很紧因为水很冰" forKey:@"clientWord"];
    [cellContent setObject:[NSNumber numberWithInt:CONCERNED] forKey:@"clientState"];
    
    NSMutableDictionary* cellContent1=[[NSMutableDictionary alloc]init];
    path=[[NSBundle mainBundle]pathForResource:@"Photos" ofType:@"png"];
    [cellContent1 setObject:[UIImage imageWithContentsOfFile:path] forKey:@"clientImage"];
    [cellContent1 setObject:@"Carlos" forKey:@"clientName"];
    [cellContent1 setObject:@"陪伴是最长情的告白" forKey:@"clientWord"];
    [cellContent1 setObject:[NSNumber numberWithInt:UNCONCERN] forKey:@"clientState"];
    
    self.list=[[NSArray alloc]initWithObjects:cellContent,cellContent1,nil];
    
    
    _headLable.title=@"关注";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    NSDictionary* cellContent=[_list objectAtIndex:indexPath.row];
    cell.imageView.image=[cellContent objectForKey:@"clientImage"];
    cell.textLabel.text=[cellContent objectForKey:@"clientName"];
    cell.detailTextLabel.text=[cellContent objectForKey:@"clientWord"];
    if([[cellContent objectForKey:@"clientState"] isEqualToNumber:[NSNumber numberWithInt:CONCERNED]]){//已关注
        UIButton* concernedButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        concernedButton.frame=CGRectMake(0, 0, 50, 30);
        [concernedButton setTitle: @"已关注"forState:UIControlStateNormal] ;
        [concernedButton setBackgroundColor:[UIColor redColor]];
        [concernedButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [concernedButton.layer setMasksToBounds:YES];//设置圆角矩形
        [concernedButton.layer setCornerRadius:10.0];
        [concernedButton addTarget:self action:@selector(onClickButtonAtIndexPath:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView=concernedButton;
        concernedButton.tag=indexPath.row;
    }else{
        UIButton* concernedButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        concernedButton.frame=CGRectMake(0, 0, 50, 30);
        [concernedButton setTitle: @"＋关注"forState:UIControlStateNormal] ;
        [concernedButton setBackgroundColor:[UIColor greenColor]];
        [concernedButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [concernedButton.layer setMasksToBounds:YES];//设置圆角矩形
        [concernedButton.layer setCornerRadius:10.0];
        [concernedButton addTarget:self action:@selector(onClickButtonAtIndexPath:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView=concernedButton;
        concernedButton.tag=indexPath.row;
    }
    return cell;
}

- (IBAction) onClickButtonAtIndexPath:(id) sender{
    UIView* onClickImage=sender;
    if ([[[_list objectAtIndex:onClickImage.tag]objectForKey:@"clientState"]isEqualToNumber:[NSNumber numberWithInt:CONCERNED]]) {
        UIAlertView* chooseView=[[UIAlertView alloc]initWithTitle:@"是否取消关注" message:@""delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        chooseView.tag=onClickImage.tag;
        [chooseView show];
    }else{
        UIAlertView* chooseView=[[UIAlertView alloc]initWithTitle:@"是否加关注" message:@""delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        chooseView.tag=onClickImage.tag;
        [chooseView show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        NSMutableDictionary* clientInformation=[_list objectAtIndex:alertView.tag];
        if([[clientInformation objectForKey:@"clientState"]isEqualToNumber:[NSNumber numberWithInt:CONCERNED]]){
            [clientInformation setObject:[NSNumber numberWithInt:UNCONCERN] forKey:@"clientState"];
        }else{
            NSMutableDictionary* clientInformation=[_list objectAtIndex:alertView.tag];
            [clientInformation setObject:[NSNumber numberWithInt:CONCERNED]forKey:@"clientState"];
        }
    }
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self.tableView reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
