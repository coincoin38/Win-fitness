//
//  WFSportModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseModel.h"

@class WFObjectiveModel;
@class WFSportDescriptionModel;

@interface WFSportModel : WFBaseModel

@property(nonatomic) NSInteger idSport;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *description_id;
@property(nonatomic,strong) NSString *colorString;
@property(nonatomic,strong) NSString *image;
@property(nonatomic,strong) UIColor *colorFromHexa;
@property(nonatomic,strong) WFSportDescriptionModel *sportDescription;
@property(nonatomic,strong) NSArray<WFObjectiveModel *> *objectives;

- (void)addDescription:(WFSportDescriptionModel *)description withObjectives:(NSArray<WFObjectiveModel *>*)objectives;

@end
