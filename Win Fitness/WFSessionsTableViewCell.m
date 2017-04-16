//
//  WFSessionsTableViewCell.m
//  Win Fitness
//
//  Created by julien gimenez on 16/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "WFSessionsTableViewCell.h"
#import "WFDaySessionModel.h"

@interface WFSessionsTableViewCell ()

@property(nonatomic,strong) UILabel *dayLabel;

@end

@implementation WFSessionsTableViewCell

#pragma mark - init

- (void)awakeFromNib{
    [super awakeFromNib];
}

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
    
    switch (self.daySessionModel.day) {
        case 0:
            self.dayLabel.text = @"Lundi";
            break;
        case 1:
            self.dayLabel.text = @"Mardi";
            break;
        case 2:
            self.dayLabel.text = @"Mercredi";
            break;
        case 3:
            self.dayLabel.text = @"Jeudi";
            break;
        case 4:
            self.dayLabel.text = @"Vendredi";
            break;
        case 5:
            self.dayLabel.text = @"Samedi";
            break;
    }
    
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
