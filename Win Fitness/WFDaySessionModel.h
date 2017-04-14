//
//  WFDaySessionModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFDaySessionModel : NSObject

@property(nonatomic,strong) NSMutableArray *sessions;
@property(nonatomic) NSInteger day;

- (instancetype)initWithArrayOfHours:(NSArray *)hours withDay:(NSInteger)day;

@end
