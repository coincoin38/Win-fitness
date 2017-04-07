//
//  WFNewsViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFCustomTextView.h"
#import "WFHeaderNewsDetailLabel.h"
#import "WFDownloadImageService.h"
#import "WFFacebookFeedModel+Additions.h"
#import "WFFacebookNewsViewModel.h"
#import "WFFooterButtonNewsDetail.h"
#import "WFNewsTableViewCell.h"
#import "WFNewsViewController.h"

@interface WFNewsViewController ()

@property(nonatomic,strong) UIBarButtonItem *facebookButton;
@property(nonatomic,strong) UIImageView *newsImage;
@property(nonatomic,strong) UIScrollView *newsScrollView;
@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) WFCustomTextView *bodyTextView;
@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;
@property(nonatomic,strong) WFFooterButtonNewsDetail *footerButton;
@property(nonatomic,strong) WFHeaderNewsDetailLabel *headerLabelFirstPart;
@property(nonatomic,strong) WFHeaderNewsDetailLabel *headerLabelSecondPart;

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
    self.headerLabelFirstPart.text = self.facebookNewsViewModel.currentNews.headerDetailFirstPart;
    self.headerLabelSecondPart.text = self.facebookNewsViewModel.currentNews.headerDetailSecondPart;

    [self.footerButton setTitle:@"Retrouvez l'article sur Facebook" forState:UIControlStateNormal];
    NSLog(@"#### data url %@",self.facebookNewsViewModel.currentNews.dataUrl);
    [self.view addSubview:self.newsScrollView];
    [self.newsScrollView addSubview:self.contentView];
    [self.contentView addSubview:self.headerLabelFirstPart];
    [self.contentView addSubview:self.headerLabelSecondPart];
    [self.contentView addSubview:self.newsImage];
    [self.contentView addSubview:self.bodyTextView];
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

- (WFHeaderNewsDetailLabel *)headerLabelFirstPart {
    if(!_headerLabelFirstPart) {
        _headerLabelFirstPart = [[WFHeaderNewsDetailLabel alloc]initWithFrame:CGRectZero
                                                            withName:self.facebookNewsViewModel.currentNews.name
                                                     withCreatedTime:self.facebookNewsViewModel.currentNews.created_time];
    }
    return _headerLabelFirstPart;
}

- (WFHeaderNewsDetailLabel *)headerLabelSecondPart {
    if(!_headerLabelSecondPart) {
        _headerLabelSecondPart = [[WFHeaderNewsDetailLabel alloc]initWithFrame:CGRectZero
                                                               withCreatedTime:self.facebookNewsViewModel.currentNews.created_time];
    }
    return _headerLabelSecondPart;
}

- (WFCustomTextView *)bodyTextView {
    if (!_bodyTextView) {
        _bodyTextView = [[WFCustomTextView alloc]initWithFrame:CGRectZero];
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

#pragma mark - Constraints

- (void)setupConstraints {
    [self.newsScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.newsScrollView);
        make.width.equalTo(self.newsScrollView);
        make.bottom.equalTo(self.footerButton.mas_bottom);
    }];

    [self.headerLabelFirstPart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.right.equalTo(self.contentView.mas_right);
    }];

    [self.headerLabelSecondPart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.headerLabelFirstPart.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right);
    }];

    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.headerLabelSecondPart.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right);
    }];

    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.newsImage.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right);
    }];

    [self.footerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.bodyTextView.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@25);
    }];
}

@end
