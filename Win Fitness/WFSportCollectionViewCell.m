//
//  WFSportCollectionViewCell.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportCollectionViewCell.h"
#import "WFSportModel.h"

@interface WFSportCollectionViewCell ()

@property(nonatomic,strong) UITextField *sportTitle;
@property(nonatomic,strong) UIImageView *sportImageView;

@end

@implementation WFSportCollectionViewCell

- (void)setupCellWithModel:(WFSportModel *)model {
    self.sportTitle.text = model.name;
    self.sportTitle.backgroundColor = [model.colorFromHexa colorWithAlphaComponent:0.9];
    self.sportImageView.image = [UIImage imageNamed:model.image];
    [self setupView];
    [self setupConstraints];
}

- (void)setupView {
    [self addSubview:self.sportImageView];
    [self addSubview:self.sportTitle];
}

- (void)setupConstraints {
    [self.sportImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];

    [self.sportTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@25);
    }];
}

- (UIImageView *)sportImageView {
    if (!_sportImageView) {
        _sportImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _sportImageView.contentMode = UIViewContentModeScaleAspectFill;
        _sportImageView.clipsToBounds = YES;
    }
    return _sportImageView;
}

- (UITextField *)sportTitle {
    if (!_sportTitle) {
        _sportTitle = [[UITextField alloc]initWithFrame:CGRectZero];
        _sportTitle.textAlignment = NSTextAlignmentCenter;
        _sportTitle.textColor = [UIColor whiteColor];
        _sportTitle.font = [UIFont boldSystemFontOfSize:14];
    }
    return _sportTitle;
}

@end
