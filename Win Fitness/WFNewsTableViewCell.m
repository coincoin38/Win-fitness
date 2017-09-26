//
//  WFNewsTableViewCell.m
//  Win Fitness
//
//  Created by julien gimenez on 04/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsTextView.h"
#import "WFDatesConverter.h"
#import "WFHeaderCellLabel.h"
#import "WFFacebookFeedModel+Additions.h"
#import "WFNewsTableViewCell.h"

@interface WFNewsTableViewCell ()

@property(nonatomic,strong) WFNewsTextView *bodyTextView;
@property(nonatomic,strong) WFHeaderCellLabel *headerLabel;

@end

@implementation WFNewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
         self.backgroundColor = [UIColor lightGrayColor];
        [self setupView];
        [self setupConstraints];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.headerLabel.text = nil;
    self.bodyTextView.text = nil;
}

#pragma mark - init

- (UIImageView *)newsImage {
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _newsImage.contentMode = UIViewContentModeScaleAspectFill;
        _newsImage.clipsToBounds = YES;
    }
    return _newsImage;
}

- (WFHeaderCellLabel *)headerLabel {
    if (!_headerLabel) {
        _headerLabel = [[WFHeaderCellLabel alloc]initWithFrame:CGRectZero];
    }
    return _headerLabel;
}

- (WFNewsTextView *)bodyTextView {
    if (!_bodyTextView) {
        _bodyTextView = [[WFNewsTextView alloc]initWithFrame:CGRectZero];
    }
    return _bodyTextView;
}

#pragma mark - Data

- (void)setupCellWithModel:(WFFacebookFeedModel *)model {
   
    self.facebookModel = model;
    self.headerLabel.text = self.facebookModel.headerCell;
    self.bodyTextView.text = self.facebookModel.bodyCell;
}

#pragma mark - User Interface Elements

- (void)setupView {
    [self addSubview:self.newsImage];
    [self addSubview:self.headerLabel];
    [self addSubview:self.bodyTextView];
}

- (void)setupConstraints {
    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
        make.width.equalTo(@74);
    }];

    [self.headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newsImage.mas_right);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@20);
    }];
    
    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newsImage.mas_right);
        make.top.equalTo(self.headerLabel.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
    }];
}

#pragma mark - User Actions

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
