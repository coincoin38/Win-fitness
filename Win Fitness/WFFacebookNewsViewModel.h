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

@interface WFFacebookNewsViewModel : NSObject

@property (nonatomic, strong) NSArray<WFFacebookFeedModel *> *facebookNews;

@property (nonatomic, strong) RACCommand *executeGetNews;

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services;

@end
