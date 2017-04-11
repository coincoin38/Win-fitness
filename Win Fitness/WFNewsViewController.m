//
//  WFNewsViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsDetailTextView.h"
#import "WFHeaderNewsDetailTitleLabel.h"
#import "WFDownloadImageService.h"
#import "WFFacebookFeedModel+Additions.h"
#import "WFFacebookNewsViewModel.h"
#import "WFFooterButtonNewsDetail.h"
#import "WFNewsTableViewCell.h"
#import "WFNewsViewController.h"
#import "WFHeaderNewsDetailDateLabel.h"

@interface WFNewsViewController ()

@property(nonatomic,strong) UIBarButtonItem *facebookButton;
@property(nonatomic,strong) UIImageView *newsImage;
@property(nonatomic,strong) UIScrollView *newsScrollView;
@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) UIView *bodyView;
@property(nonatomic,strong) WFNewsDetailTextView *bodyTextView;
@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;
@property(nonatomic,strong) WFFooterButtonNewsDetail *footerButton;
@property(nonatomic,strong) WFHeaderNewsDetailTitleLabel *headerTitleLabel;
@property(nonatomic,strong) WFHeaderNewsDetailDateLabel *headerDateLabel;

@end

@implementation WFNewsViewController

#pragma mark - Init

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel {
    self = [super init];
    
    if (self) {
        _facebookNewsViewModel = viewModel;
    }
    return self;
}

- (void)bindViewModel {
    RAC(self.newsImage,image) = RACObserve(self.facebookNewsViewModel, currentNews.downloadedPicture);
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupConstraints];
    [self bindViewModel];
}

#pragma mark - User Interface Elements

- (void)setupView {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.facebookNewsViewModel.currentNews.name;
    self.bodyTextView.text = self.facebookNewsViewModel.currentNews.bodyDetail;
    self.headerTitleLabel.text = self.facebookNewsViewModel.currentNews.headerDetailTitle;
    self.headerDateLabel.text = self.facebookNewsViewModel.currentNews.headerDetailDate;
    [self.footerButton setTitle:self.facebookNewsViewModel.currentNews.dataTitle forState:UIControlStateNormal];
    [self.view addSubview:self.newsScrollView];
    [self.newsScrollView addSubview:self.contentView];
    [self.contentView addSubview:self.headerTitleLabel];
    [self.contentView addSubview:self.headerDateLabel];
    [self.contentView addSubview:self.bodyView];
    [self.bodyView addSubview:self.bodyTextView];
    [self.bodyView addSubview:self.newsImage];
    [self.contentView addSubview:self.footerButton];
}

- (UIImageView *)newsImage {
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _newsImage.contentMode = UIViewContentModeScaleAspectFill;
        _newsImage.clipsToBounds = YES;
    }
    return _newsImage;
}

- (WFHeaderNewsDetailTitleLabel *)headerTitleLabel {
    if(!_headerTitleLabel) {
        _headerTitleLabel = [[WFHeaderNewsDetailTitleLabel alloc]initWithFrame:CGRectZero
                                                            withName:self.facebookNewsViewModel.currentNews.name];
    }
    return _headerTitleLabel;
}

- (WFHeaderNewsDetailDateLabel *)headerDateLabel {
    if(!_headerDateLabel) {
        _headerDateLabel = [[WFHeaderNewsDetailDateLabel alloc]initWithFrame:CGRectZero
                                                             withCreatedTime:self.facebookNewsViewModel.currentNews.created_time];
    }
    return _headerDateLabel;
}

- (WFNewsDetailTextView *)bodyTextView {
    if (!_bodyTextView) {
        _bodyTextView = [[WFNewsDetailTextView alloc]initWithFrame:CGRectZero
                                                          withName:self.facebookNewsViewModel.currentNews.name];
    }
    return _bodyTextView;
}

- (WFFooterButtonNewsDetail *)footerButton {
    if (!_footerButton) {
        _footerButton = [[WFFooterButtonNewsDetail alloc]initWithFrame:CGRectZero];
    }
    return _footerButton;
}

- (UIScrollView *)newsScrollView {
    if (!_newsScrollView) {
        _newsScrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    }
    return _newsScrollView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _contentView;
}

- (UIView *)bodyView {
    if (!_bodyView) {
        _bodyView = [[UIView alloc]initWithFrame:CGRectZero];
        _bodyView.backgroundColor = [UIColor lightGrayColor];
    }
    return _bodyView;
}

#pragma mark - Constraints

- (void)setupConstraints {
    [self.newsScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.newsScrollView);
        make.width.equalTo(self.newsScrollView);
        make.bottom.equalTo(self.footerButton.mas_bottom).offset(5);
    }];

    [self.headerTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.right.equalTo(self.contentView.mas_right);
    }];

    [self.headerDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.headerTitleLabel.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right);
    }];

    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.top.equalTo(self.headerDateLabel.mas_bottom).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.bottom.equalTo(self.newsImage.mas_bottom).offset(1);
    }];

    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bodyView.mas_left).offset(0.5);
        make.top.equalTo(self.bodyView.mas_top).offset(0.5);
        make.right.equalTo(self.bodyView.mas_right).offset(-0.5);
    }];

    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bodyView.mas_left).offset(0.5);
        make.top.equalTo(self.bodyTextView.mas_bottom).offset(0);
        make.right.equalTo(self.bodyView.mas_right).offset(-0.5);
    }];

    [self.footerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.top.equalTo(self.bodyView.mas_bottom).offset(8);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
    }];
}

@end
