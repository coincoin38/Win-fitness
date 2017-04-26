//
//  WFFullSessionsModel.h
//  Win Fitness
//
//  Created by julien gimenez on 21/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseModel.h"

typedef NS_ENUM(NSInteger, WFSessionsType) {
    MILLS  = 0,
    RPM = 1
};

@interface WFFullSessionsModel : WFBaseModel

@property(nonatomic,strong) NSArray *millsSessions;
@property(nonatomic,strong) NSArray *rpmSessions;

- (instancetype)initWithMillsSessions:(NSArray *)millsArray withRpmSessions:(NSArray *)rpmArray;

@end
