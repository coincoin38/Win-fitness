//
//  WFSportCollectionViewCell.h
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@class WFSportModel;

@interface WFSportCollectionViewCell : UICollectionViewCell

- (void)setupCellWithModel:(WFSportModel *)model;

@end
