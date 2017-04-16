//
//  WFSessionsTableViewCell.h
//  Win Fitness
//
//  Created by julien gimenez on 16/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WFDaySessionModel;

@interface WFSessionsTableViewCell : UITableViewCell

@property(nonatomic,strong) WFDaySessionModel *daySessionModel;

- (void)setupCellWithModel:(WFDaySessionModel *)model;

@end
