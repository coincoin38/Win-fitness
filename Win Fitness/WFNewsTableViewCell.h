//
//  WFNewsTableViewCell.h
//  Win Fitness
//
//  Created by julien gimenez on 04/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WFFacebookFeedModel;

@interface WFNewsTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView *newsImage;

- (void)setupCellWithModel:(WFFacebookFeedModel *)model;

@end
