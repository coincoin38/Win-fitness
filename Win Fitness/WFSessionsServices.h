//
//  WFSessionsServices.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <ReactiveObjC.h>

@class WFSessionModel;

@interface WFSessionsServices : NSObject

- (RACSignal *)sessionsServiceSignal;

@end
