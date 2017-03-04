//
//  WFNewsTableViewCell.m
//  Win Fitness
//
//  Created by julien gimenez on 04/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsTableViewCell.h"
#import <Masonry/Masonry.h>
#import "WFFacebookFeedModel.h"

@interface WFNewsTableViewCell ()

@property(nonatomic,strong) UILabel *dayLabel;
@property(nonatomic,strong) UITextView *bodyTextView;
@property(nonatomic,strong) UIImageView *newsImage;

@end

@implementation WFNewsTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setupCellWithModel:(WFFacebookFeedModel *)model
{
    [self setupView];
    [self setupConstraints];
}

- (void)setupView
{
    self.backgroundColor = [UIColor redColor];
}

- (void)setupConstraints
{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
