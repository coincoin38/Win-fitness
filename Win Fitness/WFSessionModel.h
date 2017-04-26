//
//  WFSessionModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseModel.h"

@class WFSportModel;

@interface WFSessionModel : WFBaseModel

@property(nonatomic) BOOL attendance;

@property(nonatomic) NSInteger idSport;
@property(nonatomic,strong) NSString *from;
@property(nonatomic,strong) NSString *duration;
@property(nonatomic,strong) NSString *day;

@property(nonatomic,strong) WFSportModel *sport;

@end
