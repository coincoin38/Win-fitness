//
//  WFSessionsTableViewCell.h
//  Win Fitness
//
//  Created by julien gimenez on 16/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFTableViewCell.h"

@class WFDaySessionModel;

@interface WFWeekSessionsTableViewCell : WFTableViewCell

@property(nonatomic,strong) WFDaySessionModel *daySessionModel;
@property(nonatomic,strong) UIButton *millsButton;
@property(nonatomic,strong) UIButton *rpmButton;

- (void)setupCellWithModel:(WFDaySessionModel *)model;

@end
