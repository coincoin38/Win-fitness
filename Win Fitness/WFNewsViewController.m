//
//  WFNewsViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsViewController.h"
#import "WFFacebookFeedModel.h"
#import "WFDownloadImageService.h"
#import "WFFacebookNewsViewModel.h"
#import "WFCustomTextView.h"

@interface WFNewsViewController ()

@property(nonatomic,strong) UIImageView *newsImage;
@property(nonatomic,strong) UIScrollView *newsScrollView;
@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) WFCustomTextView *bodyTextView;
@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;

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

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupConstraints];
    [self bindViewModel];
}

- (void)bindViewModel {
    [WFDownloadImageService downloadImage:self.facebookNewsViewModel.currentNews.full_picture
                           forUIImageView:self.newsImage];
    
    RAC(self.bodyTextView,text) = RACObserve(self.facebookNewsViewModel, newsDetails);

    [self.facebookNewsViewModel createNewsDetail:^(id result, NSError *error) {

    }];
}

#pragma mark - User Interface Elements

- (UIImageView *)newsImage {
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _newsImage.contentMode = UIViewContentModeScaleAspectFill;
        _newsImage.clipsToBounds = YES;
    }
    return _newsImage;
}

- (WFCustomTextView *)bodyTextView {
    if (!_bodyTextView) {
        _bodyTextView = [[WFCustomTextView alloc]initWithFrame:CGRectZero];
    }
    return _bodyTextView;
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

- (void)setupView {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.newsScrollView];
    [self.newsScrollView addSubview:self.contentView];
    [self.contentView addSubview:self.newsImage];
    [self.contentView addSubview:self.bodyTextView];
}

#pragma mark - Constraints

- (void)setupConstraints {
    [self.newsScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.newsScrollView);
        make.width.equalTo(self.newsScrollView);
        make.bottom.equalTo(self.bodyTextView.mas_bottom).offset(5);
    }];
    
    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right);
    }];

    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.top.equalTo(self.newsImage.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
    }];
}

@end
