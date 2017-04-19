//
//  WFSessionsTableViewCell.m
//  Win Fitness
//
//  Created by julien gimenez on 16/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFWeekSessionsTableViewCell.h"
#import "WFDaySessionModel+Additions.h"

@interface WFWeekSessionsTableViewCell ()

@property(nonatomic,strong) UILabel *dayLabel;

@end

@implementation WFWeekSessionsTableViewCell

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dayLabel;
}

#pragma mark - Data

- (void)setupCellWithModel:(WFDaySessionModel *)model {
    self.backgroundColor = [UIColor whiteColor];
    self.daySessionModel = model;
    self.dayLabel.text = [model dayString];
    [self setupView];
    [self setupConstraints];
}

#pragma mark - User Interface Elements

- (void)setupView {
    [self addSubview:self.dayLabel];
}

- (void)setupConstraints {
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - User Actions

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
