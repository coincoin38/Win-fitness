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
#import "WFDatesConverter.h"
#import "WFDayCellLabel.h"
#import "WFCustomTextView.h"

@interface WFNewsTableViewCell ()

@property(nonatomic,strong) WFDayCellLabel *dayLabel;
@property(nonatomic,strong) WFCustomTextView *bodyTextView;

@end

@implementation WFNewsTableViewCell

#pragma mark - init

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (UIImageView *)newsImage {
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _newsImage.contentMode = UIViewContentModeScaleAspectFill;
        _newsImage.clipsToBounds = YES;
    }
    return _newsImage;
}

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [[WFDayCellLabel alloc]initWithFrame:CGRectZero];
    }
    return _dayLabel;
}

- (UITextView *)bodyTextView {
    if (!_bodyTextView) {
        _bodyTextView = [[WFCustomTextView alloc]initWithFrame:CGRectZero];
    }
    return _bodyTextView;
}

#pragma mark - Data

- (void)setupCellWithModel:(WFFacebookFeedModel *)model {
    self.backgroundColor = [UIColor lightGrayColor];
    self.facebookModel = model;
    self.dayLabel.text = [WFDatesConverter formatMMddFromDateString:model.created_time];
    self.bodyTextView.text = model._description;
    [self setupView];
    [self setupConstraints];
}

#pragma mark - User Interface Elements

- (void)setupView {
    [self addSubview:self.newsImage];
    [self addSubview:self.dayLabel];
    [self addSubview:self.bodyTextView];
}

- (void)setupConstraints {
    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(@74);
    }];

    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newsImage.mas_right);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@20);
    }];
    
    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newsImage.mas_right);
        make.top.equalTo(self.dayLabel.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
    }];
}

#pragma mark - User Actions

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
