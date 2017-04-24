//
//  WFDaySessionsTableViewCell.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDaySessionsTableViewCell.h"
#import "WFSessionModel+Additions.h"

@interface WFDaySessionsTableViewCell ()

@property(nonatomic,strong) UILabel *sportLabel;
@property(nonatomic,strong) UILabel *startHourLabel;
@property(nonatomic,strong) UILabel *durationLabel;
@property(nonatomic,strong) UILabel *explorerLabel;
@property(nonatomic,strong) UIView *timeContentView;

@end

@implementation WFDaySessionsTableViewCell

#pragma mark - Data

- (void)setupCellWithModel:(WFSessionModel *)model {
    self.sessionModel = model;
    self.sportLabel.text = model.titleSport ? : WFLocalisedString(@"EMPTY");
    self.startHourLabel.text = model.from;
    self.durationLabel.text = model.duration;
    self.explorerLabel.text = @"";

    if (!model.attendance) {
        self.startHourLabel.backgroundColor = [UIColor greenColor];
        self.durationLabel.backgroundColor = [UIColor greenColor];
        self.explorerLabel.text = @"EXPLORER";
    }
    else {
        self.startHourLabel.backgroundColor = [UIColor purpleColor];
        self.durationLabel.backgroundColor = [UIColor purpleColor];
    }

    [self setupView];
}

#pragma mark - User Interface Elements

- (void)setupView {
    self.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.timeContentView];
    [self.timeContentView addSubview:self.startHourLabel];
    [self.timeContentView addSubview:self.durationLabel];
    [self addSubview:self.sportLabel];
    [self addSubview:self.explorerLabel];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.timeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(@75);
    }];

    [self.startHourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeContentView.mas_left);
        make.top.equalTo(self.timeContentView.mas_top);
        make.right.equalTo(self.timeContentView.mas_right);
        make.height.equalTo(@37);
    }];

    [self.durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeContentView.mas_left);
        make.top.equalTo(self.startHourLabel.mas_bottom);
        make.right.equalTo(self.timeContentView.mas_right);
        make.height.equalTo(@37);
    }];

    [self.sportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.timeContentView.mas_right);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
    }];

    [self.explorerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.width.equalTo(@50);
    }];
}

- (UILabel *)sportLabel {
    if (!_sportLabel) {
        _sportLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _sportLabel.textAlignment = NSTextAlignmentCenter;
        _sportLabel.backgroundColor = [UIColor whiteColor];
    }
    return _sportLabel;
}

- (UILabel *)startHourLabel {
    if (!_startHourLabel) {
        _startHourLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _startHourLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _startHourLabel;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _durationLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _durationLabel;
}

- (UILabel *)explorerLabel {
    if (!_explorerLabel) {
        _explorerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _explorerLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _explorerLabel;
}

- (UIView *)timeContentView {
    if (!_timeContentView) {
        _timeContentView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _timeContentView;
}

#pragma mark - User Actions

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
