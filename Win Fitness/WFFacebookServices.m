//
//  WFFaceBookServices.m
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "WFFacebookConstants.h"
#import "WFFaceBookServices.h"

@implementation WFFacebookServices

- (instancetype)init{
    if ((self = [super init])) {
        _token = nil;
    }
    return self;
};

- (RACSignal *)newsGetSignal{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        return [RACDisposable disposableWithBlock:^{
            [self grabNews:^(id result, NSError *error) {
                [subscriber sendNext:result];
            }];

        }];
    }];
}

- (void)grabNews:(WFFacebookHandler)handler{
    
    if (self.token == nil) {
        [self generateToken:^(id result, NSError *error) {
            if (result) {
                [self downloadNews:^(id result, NSError *error) {
                    handler(result,error);
                }];
            }
            else{
                handler(nil,error);
            }
        }];
    }
    else{
        
        [self downloadNews:^(id result, NSError *error) {
            if (error) {
                self.token = nil;
            }
            handler(result,error);
        }];
    }
}

- (void)downloadNews:(WFFacebookHandler)handler{
    
    [[self grapRequestNewsWithToken:self.token] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        handler(result,error);
    }];
}

- (void)generateToken:(WFFacebookHandler)handler{
    
    [[self graphRequestToken] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (result) {
            self.token = result[kValueFieldsToken];
        }
        handler(self.token,error);
    }];
}

- (FBSDKGraphRequest *)graphRequestToken{
    
    return [[FBSDKGraphRequest alloc]initWithGraphPath:kPathAuthToken
                                            parameters:[WFFacebookConstants authTokenParameters]];
}

- (FBSDKGraphRequest *)grapRequestNewsWithToken:(NSString *)token{
    
    return [[FBSDKGraphRequest alloc]initWithGraphPath:kFeedNews
                                            parameters:[WFFacebookConstants newsParameters]
                                           tokenString:token
                                               version:kVersionAPI
                                            HTTPMethod:kGetMethod];
}

@end
