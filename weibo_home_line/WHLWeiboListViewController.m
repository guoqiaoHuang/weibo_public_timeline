//
//  WHLWeiboListViewController.m
//  weibo_home_line
//
//  Created by Huang Jin on 12-12-27.
//  Copyright (c) 2012年 Huang Jin. All rights reserved.
//

#import "WHLWeiboListViewController.h"
#import "WHLAll.h"

@interface WHLWeiboListViewController ()

@end

@implementation WHLWeiboListViewController
@synthesize tweets, tableView;

//- (id) initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        //
//        tweets = [[NSMutableArray alloc] init];
//    }
//    return self;
//}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{   
    [super viewDidLoad];
    [self getRecentList];
        
    __weak WHLWeiboListViewController *weakSelf = self;
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf refresh];
    }];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void) refresh {
    [self.tableView.pullToRefreshView startAnimating];
    [self getRecentList];
    [self.tableView.pullToRefreshView stopAnimating];    
}

- (void) getRecentList {
    [Tweet getWeiboList: ^(NSArray *objects, NSError *error) {
        if (!error) {
            self.tweets = [NSMutableArray arrayWithArray:objects];
            [self.tableView reloadData];
        }        
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
}


- (void) viewDidLayoutSubviews {
//    [SVProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [tweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Tweet *tweet = [self.tweets objectAtIndex:indexPath.row];

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Weibo"];
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:1];
    cellLabel.text = tweet.text;
    cellLabel.font = [UIFont systemFontOfSize:10.0];
    
    NSURL *img_url = [NSURL URLWithString:tweet.userAvatar];
    NSData *img_data = [[NSData alloc] initWithContentsOfURL:img_url];
    UIImage *image = [UIImage imageWithData:img_data scale:1.0];
    cell.imageView.image = image;
            
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
