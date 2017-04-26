//
//  WFDaySessionModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseModel.h"

typedef NS_ENUM(NSInteger, WFDays) {
    Monday  = 0,
    Tuesday = 1,
    Wednesday = 2,
    Thursday = 3,
    Friday = 4,
    Saturday = 5
};
@class WFSessionModel;

@interface WFDaySessionModel : WFBaseModel

@property(nonatomic,strong) NSMutableArray<WFSessionModel *> *sessions;
@property(nonatomic) NSInteger day;

- (instancetype)initWithArrayOfHours:(NSArray *)hours withDay:(NSInteger)day;

@end
