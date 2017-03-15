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
@property (nonatomic, strong) RACCommand *executeGetNews;
@property (strong, nonatomic) RACCommand *executeSearch;

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services;
- (void)start:(WFFacebookHandler)handler;

@end
