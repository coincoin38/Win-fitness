//
//  WFSessionsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@class WFSessionModel;
@class WFSessionsServices;

typedef void (^WFSessionHandler)(id result,NSError *error);

@interface WFSessionsViewModel : NSObject

@property (nonatomic, strong) RACCommand *sessionsCommand;
@property (nonatomic, strong) NSArray<WFSessionModel *> *sessions;

- (instancetype)initWithSessionsServices:(WFSessionsServices *)services;

@end
