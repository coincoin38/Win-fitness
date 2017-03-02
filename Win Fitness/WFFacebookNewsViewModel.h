//
//  WFFacebookNewsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFFaceBookServices.h"

@interface WFFacebookNewsViewModel : NSObject

@property (nonatomic, strong) NSString *firstNewsTitle;
@property (nonatomic, strong) RACCommand *executeGetNews;

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services;

@end
