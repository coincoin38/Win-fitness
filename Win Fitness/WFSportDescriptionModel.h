//
//  WFSportDescriptionModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseModel.h"

@interface WFSportDescriptionModel : WFBaseModel

@property(nonatomic) NSInteger key_sport;
@property(nonatomic, strong) NSString *content;

@end
