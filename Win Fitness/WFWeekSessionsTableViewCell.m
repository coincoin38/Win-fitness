//
//  WFSessionsTableViewCell.m
//  Win Fitness
//
//  Created by julien gimenez on 16/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFWeekSessionsTableViewCell.h"
#import "WFDaySessionModel+Additions.h"
#import "UIColor+Additions.h"

@interface WFWeekSessionsTableViewCell ()

@property(nonatomic,strong) UILabel *dayLabel;
@property(nonatomic,strong) UIImageView *lesMilsImageView;
@property(nonatomic,strong) UIImageView *RPMImageView;

@end

@implementation WFWeekSessionsTableViewCell

#pragma mark - Data

- (void)setupCellWithModel:(WFDaySessionModel *)model {
    self.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.daySessionModel = model;
    self.dayLabel.text = [model dayString];
    [self setupView];
    [self setupConstraints];
}

#pragma mark - User Interface Elements

- (void)setupView {
    self.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.dayLabel];
    [self addSubview:self.RPMImageView];
    [self addSubview:self.lesMilsImageView];
}

- (void)setupConstraints {
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.RPMImageView.mas_left);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(self.RPMImageView.mas_width);
    }];

    [self.RPMImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(self.mas_width).dividedBy(3);
    }];

    [self.lesMilsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.RPMImageView.mas_right);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
    }];
}

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _dayLabel.backgroundColor = [UIColor veryLightGrayWF];
        _dayLabel.font = [UIFont boldSystemFontOfSize:16];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.textColor = [UIColor darkGrayWF];
    }
    return _dayLabel;
}

- (UIImageView *)RPMImageView {
    if (!_RPMImageView) {
        _RPMImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _RPMImageView.image = [UIImage imageNamed:@"RPM"];
        _RPMImageView.contentMode = UIViewContentModeScaleAspectFit;
        _RPMImageView.clipsToBounds = YES;
        _RPMImageView.backgroundColor = [UIColor whiteColor];
    }
    return _RPMImageView;
}

- (UIImageView *)lesMilsImageView {
    if (!_lesMilsImageView) {
        _lesMilsImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _lesMilsImageView.image = [UIImage imageNamed:@"MILLS"];
        _lesMilsImageView.contentMode = UIViewContentModeScaleAspectFit;
        _lesMilsImageView.clipsToBounds = YES;
        _lesMilsImageView.backgroundColor = [UIColor whiteColor];
    }
    return _lesMilsImageView;
}

#pragma mark - User Actions

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
