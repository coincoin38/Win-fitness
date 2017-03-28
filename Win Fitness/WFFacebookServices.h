//
//  WFFaceBookServices.h
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@class WFFacebookFeedModel;

@interface WFFacebookServices : NSObject

- (instancetype)initService;

- (RACSignal *)detailsNewsServiceSignal:(WFFacebookFeedModel *)news;
- (RACSignal *)newsServiceSignal;

@end
