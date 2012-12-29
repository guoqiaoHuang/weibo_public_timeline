//
//  WHLWeiboTimelineController.m
//  weibo_home_line
//
//  Created by Huang Jin on 12-12-29.
//  Copyright (c) 2012年 Huang Jin. All rights reserved.
//

#import "WHLWeiboTimelineController.h"

@interface WHLWeiboTimelineController ()

@end

@implementation WHLWeiboTimelineController
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [SVProgressHUD showWithStatus:@"获取数据..."];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
