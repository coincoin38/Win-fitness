//
//  WFObjectiveModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseModel.h"

@interface WFObjectiveModel : WFBaseModel

@property(nonatomic, strong) NSString *firstPart;
@property(nonatomic, strong) NSString *secondPart;
@property(nonatomic) NSInteger sport_id;

@end
