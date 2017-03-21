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

@interface WFNewsTableViewCell ()

@property(nonatomic,strong) UILabel *dayLabel;
@property(nonatomic,strong) UITextView *bodyTextView;
@property(nonatomic,strong) UIView *supportView;
@property(nonatomic,strong) WFFacebookFeedModel *facebookModel;

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
    }
    return _newsImage;
}

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _dayLabel.backgroundColor = [UIColor redColor];
    }
    return _dayLabel;
}

- (UIView *)supportView {
    if (!_supportView) {
        _supportView = [[UIView alloc]initWithFrame:CGRectZero];
        _supportView.backgroundColor = [UIColor whiteColor];
    }
    return _supportView;
}

- (UITextView *)bodyTextView {
    if (!_bodyTextView) {
        _bodyTextView = [[UITextView alloc]initWithFrame:CGRectZero];
        _bodyTextView.scrollEnabled = NO;
        _bodyTextView.userInteractionEnabled = NO;
        _bodyTextView.textAlignment = NSTextAlignmentJustified;
    }
    return _bodyTextView;
}

#pragma mark - Data

- (void)setupCellWithModel:(WFFacebookFeedModel *)model {
    self.facebookModel = model;
    self.dayLabel.text = [WFDatesConverter formatMMddFromDateString:model.created_time];
    self.bodyTextView.text = model._description;
    [self setupView];
    [self setupConstraints];
}

#pragma mark - User Interface Elements

- (void)setupView {
    [self addSubview:self.newsImage];
    [self addSubview:self.supportView];
    [self.supportView addSubview:self.dayLabel];
    [self.supportView addSubview:self.bodyTextView];
}

- (void)setupConstraints {
    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self);
        make.width.equalTo(@75);
    }];

    [self.supportView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.newsImage.mas_right);
        make.right.equalTo(self.mas_right);
    }];

    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.supportView.mas_top);
        make.left.equalTo(self.supportView.mas_left).offset(5);
        make.height.equalTo(@25);
    }];
    
    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dayLabel.mas_bottom);
        make.bottom.equalTo(self.supportView.mas_bottom);
        make.left.equalTo(self.supportView.mas_left);
        make.right.equalTo(self.supportView.mas_right);
    }];
}

#pragma mark - User Actions

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
