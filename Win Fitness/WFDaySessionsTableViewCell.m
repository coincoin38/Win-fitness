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

@end

@implementation WFDaySessionsTableViewCell

- (UILabel *)sportLabel {
    if (!_sportLabel) {
        _sportLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _sportLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _sportLabel;
}

- (void)setupCellWithModel:(WFSessionModel *)model {
    self.backgroundColor = [UIColor whiteColor];
    self.sessionModel = model;
    self.sportLabel.text = model.titleSport ? : WFLocalisedString(@"EMPTY");
    [self setupView];
    [self setupConstraints];
}

#pragma mark - User Interface Elements

- (void)setupView {
    [self addSubview:self.sportLabel];
}

- (void)setupConstraints {
    [self.sportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
