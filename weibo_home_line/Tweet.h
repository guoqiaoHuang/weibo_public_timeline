//
//  Tweet.h
//  weibo_home_line
//
//  Created by Huang Jin on 12-12-27.
//  Copyright (c) 2012年 Huang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject
@property(strong, nonatomic) NSString *text;
@property(strong, nonatomic) NSString *userName;
@property(strong, nonatomic) NSString *userAvatar;


+(void) getWeiboList: (void (^)(NSArray *objects, NSError *error)) async;
@end
