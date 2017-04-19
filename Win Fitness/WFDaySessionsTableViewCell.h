//
//  WFDaySessionsTableViewCell.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFTableViewCell.h"

@class WFSessionModel;

@interface WFDaySessionsTableViewCell : WFTableViewCell

@property(nonatomic,strong) WFSessionModel *sessionModel;

- (void)setupCellWithModel:(WFSessionModel *)model;

@end
