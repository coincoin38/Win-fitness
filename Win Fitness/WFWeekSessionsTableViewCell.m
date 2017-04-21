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
@property(nonatomic,strong) UIImageView *millsImageView;
@property(nonatomic,strong) UIImageView *rpmImageView;

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
    [self addSubview:self.rpmImageView];
    [self addSubview:self.millsImageView];
    [self addSubview:self.rpmButton];
    [self addSubview:self.millsButton];
}

- (void)setupConstraints {
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.rpmImageView.mas_left);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(self.rpmImageView.mas_width);
    }];

    [self.rpmImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(self.mas_width).dividedBy(3);
    }];

    [self.millsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rpmImageView.mas_right);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
    }];

    [self.rpmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.rpmImageView);
    }];

    [self.millsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.millsImageView);
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

- (UIImageView *)rpmImageView {
    if (!_rpmImageView) {
        _rpmImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _rpmImageView.image = [UIImage imageNamed:@"RPM"];
        _rpmImageView.contentMode = UIViewContentModeScaleAspectFit;
        _rpmImageView.clipsToBounds = YES;
        _rpmImageView.backgroundColor = [UIColor whiteColor];
    }
    return _rpmImageView;
}

- (UIImageView *)millsImageView {
    if (!_millsImageView) {
        _millsImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _millsImageView.image = [UIImage imageNamed:@"MILLS"];
        _millsImageView.contentMode = UIViewContentModeScaleAspectFit;
        _millsImageView.clipsToBounds = YES;
        _millsImageView.backgroundColor = [UIColor whiteColor];
    }
    return _millsImageView;
}

- (UIButton *)rpmButton {
    if (!_rpmButton) {
        _rpmButton = [[UIButton alloc]initWithFrame:CGRectZero];
        _rpmButton.backgroundColor = [UIColor clearColor];
    }
    return _rpmButton;
}

- (UIButton *)millsButton {
    if (!_millsButton) {
        _millsButton = [[UIButton alloc]initWithFrame:CGRectZero];
        _millsButton.backgroundColor = [UIColor clearColor];
    }
    return _millsButton;
}

#pragma mark - User Actions

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
