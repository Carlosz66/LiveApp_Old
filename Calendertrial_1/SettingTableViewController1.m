//
//  MyTableViewController1.m
//  Calendertrial_1
//
//  Created by zyc on 15/1/29.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "SettingTableViewController1.h"

@interface SettingTableViewController1 ()

@end

@implementation SettingTableViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    _contentOfSection=[[NSArray alloc]initWithObjects:@"版本信息",@"帮助",@"使用说明", nil];
    _sections=[[NSArray alloc]initWithObjects:@"开启通知",@"日历格式",@"启用密码锁",nil];
    _notificationSwitch=NO;
    _passwordSwitch=NO;
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    NSLog(@"numberofsection");
    return 4;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"numberofrows");
    switch (section) {
        case 0:case 1:case 2:
            return 1;
            break;
        case 3:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     NSLog(@"cellforrowatindexpath");
    
    NSString * indetify=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indetify forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetify];
    }
    
    if (indexPath.section==3) {
        cell.textLabel.text=[_contentOfSection objectAtIndex:indexPath.row];
    }
    else{
    cell.textLabel.text=[_sections objectAtIndex:indexPath.section];
    }
    
    if (indexPath.section==0) {
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        [switchview addTarget:self action:@selector(updateSwitchAtIndexPath:) forControlEvents:UIControlEventValueChanged];
        [switchview setOn:_notificationSwitch animated:YES];
        cell.accessoryView = switchview;
        switchview.tag=0;
       
    }else if (indexPath.section==2) {
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        [switchview addTarget:self action:@selector(updateSwitchAtIndexPath:) forControlEvents:UIControlEventValueChanged];
        [switchview setOn:_passwordSwitch animated:YES];
        cell.accessoryView = switchview;
        switchview.tag=1;
        
    }
    else{
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//添加附加的样子
    }
    // Configure the cell...
    
    return cell;
}

- (IBAction) updateSwitchAtIndexPath:(id) sender{
    UISwitch *switchView = (UISwitch *)sender;
    
    if ([switchView isOn])
    {
        if (switchView.tag==0) {
            _notificationSwitch=YES;
                NSLog(@"notificationYES");
        }else if(switchView.tag==1){
            _passwordSwitch=YES;
        }
    }
    else
    {
        if (switchView.tag==0) {
            _notificationSwitch=NO;
        }else if(switchView.tag==1){
            _passwordSwitch=NO;
                NSLog(@"passwordNO");
        }
    }
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


#pragma mark Table View Delegate Source


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    NSLog(@"heightforheaderinsection");
    if(section==0){
        return 30;
    }
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section==0) {
        return 15;
    }
    return 5;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        
        label.font = [UIFont boldSystemFontOfSize:14];
        
        label.textColor = [UIColor blackColor];

        label.text = [NSString stringWithFormat:@"通知"];
        
        //[headerView addSubview:label];
        
        
        return label;
        
    }else if(section==1){
        //UIView* section1View=[[UIView alloc]initWithFrame:CGRectMake(0, 50, 100, 100)];
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 50, 100, 100)];
        label.font = [UIFont boldSystemFontOfSize:14];
        label.text=[NSString stringWithFormat:@"日历"];
        label.textColor=[UIColor blackColor];
        //[section1View addSubview:label1];
        return label;
        
    }else if(section==2){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        
        label.font = [UIFont boldSystemFontOfSize:14];
        
        label.textColor = [UIColor blackColor];
        
        label.text = [NSString stringWithFormat:@"密码锁"];
        return label;

    }
    else{
        
        return nil;
        
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if(section == 0){
        NSLog(@"headsection1");
        //UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        
        label.font = [UIFont boldSystemFontOfSize:14];
        
        label.textColor = [UIColor blackColor];
        
        label.text = [NSString stringWithFormat:@"如果您关闭那么您将不会收到任何通知或推送"];
        
        //[headerView addSubview:label];
        
        
        return label;
    }
    else{
        
        NSLog(@"headsection3");
        return nil;
        
    }
}
@end
