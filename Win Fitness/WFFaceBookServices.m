//
//  WFFaceBookServices.m
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFaceBookServices.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@implementation WFFaceBookServices

- (void)generateToken:(WFFacebookHandler)handler{

    FBSDKGraphRequest *grabToken = [[FBSDKGraphRequest alloc]initWithGraphPath:@"/oauth/access_token"
                                                                    parameters:@{@"client_id":@"1188664067920799",
                                                                                 @"client_secret":@"aef4309801db979e175817353cc18427",
                                                                                 @"grant_type":@"client_credentials",
                                                                                 @"fields":@"access_token"}];
   
    [grabToken startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        handler(result[@"access_token"],error);
    }];
}

- (void)grabNews:(NSString *)token :(WFFacebookHandler)handler{
    
    FBSDKGraphRequest *grabInfos = [[FBSDKGraphRequest alloc]initWithGraphPath:@"1207136935980128/feed"
                                                                    parameters:@{@"limit":@"10",
                                                                                 @"fields":@"full_picture,actions,description,message,created_time,type"}
                                                                   tokenString:token
                                                                       version:@"v2.8"
                                                                    HTTPMethod:@"GET"];
    
    [grabInfos startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        handler(result,error);
    }];
}

@end
