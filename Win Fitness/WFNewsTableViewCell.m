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
        _newsImage.clipsToBounds = YES;
    }
    return _newsImage;
}

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _dayLabel.font = [UIFont boldSystemFontOfSize:12];
        _dayLabel.backgroundColor = [UIColor whiteColor];
    }
    return _dayLabel;
}

- (UITextView *)bodyTextView {
    if (!_bodyTextView) {
        _bodyTextView = [[UITextView alloc]initWithFrame:CGRectZero];
        _bodyTextView.scrollEnabled = NO;
        _bodyTextView.userInteractionEnabled = NO;
        _bodyTextView.textAlignment = NSTextAlignmentJustified;
        _bodyTextView.font = [UIFont systemFontOfSize:14];
        _bodyTextView.backgroundColor = [UIColor whiteColor];
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
    [self addSubview:self.dayLabel];
    [self addSubview:self.bodyTextView];
}

- (void)setupConstraints {
    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(@75);
    }];

    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newsImage.mas_right).offset(5);
        make.top.equalTo(self.mas_top);
        make.height.equalTo(@20);
    }];
    
    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newsImage.mas_right);
        make.top.equalTo(self.dayLabel.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

#pragma mark - User Actions

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
