//
//  WFNewsTableViewCell.h
//  Win Fitness
//
//  Created by julien gimenez on 04/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFTableViewCell.h"

@class WFFacebookFeedModel;

@interface WFNewsTableViewCell : WFTableViewCell

@property(nonatomic,strong) UIImageView *newsImage;
@property(nonatomic,strong) WFFacebookFeedModel *facebookModel;

- (void)setupCellWithModel:(WFFacebookFeedModel *)model;

@end
