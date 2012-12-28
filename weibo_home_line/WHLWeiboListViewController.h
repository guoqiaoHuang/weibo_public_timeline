//
//  WHLWeiboListViewController.h
//  weibo_home_line
//
//  Created by Huang Jin on 12-12-27.
//  Copyright (c) 2012年 Huang Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHLWeiboListViewController : UITableViewController{
}
@property(strong, nonatomic) NSMutableArray *tweets;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
//-(IBAction) show:(id)sender;

@end
