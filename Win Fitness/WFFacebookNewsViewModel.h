//
//  WFFacebookNewsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFFaceBookServices.h"

@class WFFacebookFeedModel;

typedef void (^WFFacebookHandler)(id result,NSError *error);

@interface WFFacebookNewsViewModel : NSObject

@property (nonatomic, strong) NSArray<WFFacebookFeedModel *> *facebookNews;
@property (nonatomic, strong) NSString *newsDetails;
@property (nonatomic, strong) WFFacebookFeedModel *currentNews;
@property (nonatomic, strong) RACCommand *executeGetNews;
@property (nonatomic, strong) RACCommand *executeGetNewsDetails;

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services;
- (void)startNewsFeedWithHandler:(WFFacebookHandler)handler;
- (void)createNewsDetail;

@end
