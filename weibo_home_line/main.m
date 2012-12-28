//
//  main.m
//  weibo_home_line
//
//  Created by Huang Jin on 12-12-27.
//  Copyright (c) 2012年 Huang Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WHLAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [NUISettings init];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([WHLAppDelegate class]));
    }
}
