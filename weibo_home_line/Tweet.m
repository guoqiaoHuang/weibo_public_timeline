//
//  Tweet.m
//  weibo_home_line
//
//  Created by Huang Jin on 12-12-27.
//  Copyright (c) 2012年 Huang Jin. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet
@synthesize text, userName, userAvatar;

+(void) getWeiboList: (void (^)(NSArray *objects, NSError *error)) async {
    
    RKObjectMapping *tweetMapping = [RKObjectMapping mappingForClass:[Tweet class]];
    [tweetMapping addAttributeMappingsFromDictionary:@{
        @"text": @"text",
        @"user.screen_name": @"userName",
        @"user.profile_image_url": @"userAvatar"
    }];
    RKResponseDescriptor *respDesc = [RKResponseDescriptor responseDescriptorWithMapping:tweetMapping pathPattern:nil keyPath:@"statuses" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    NSString *url_str = [NSString stringWithFormat:@"%@?access_token=%@", kWeiboHomeLineURL, kAccessToken];
    NSURL *url = [NSURL URLWithString:url_str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ respDesc ]];
    
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSArray *result = [mappingResult array];
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
        dispatch_async(dispatch_get_main_queue(), ^{
            async(result, nil);
            [SVProgressHUD dismiss];
        });
        

    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        RKLogError(@"Operation failed with error: %@", error);
    }];
    
    [objectRequestOperation start];
        
}

@end
