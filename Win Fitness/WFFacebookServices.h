//
//  WFFaceBookServices.h
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

typedef void (^WFFacebookHandler)(id result,NSError *error);

@interface WFFacebookServices : NSObject

@property (strong, nonatomic) NSString *token;

- (void)grabNews:(WFFacebookHandler)handler;
- (RACSignal *)newsGetSignal;

@end
