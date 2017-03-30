//
//  WFNewsViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFCustomTextView.h"
#import "WFDayCellLabel.h"
#import "WFDownloadImageService.h"
#import "WFFacebookFeedModel+Additions.h"
#import "WFFacebookNewsViewModel.h"
#import "WFNewsTableViewCell.h"
#import "WFNewsViewController.h"

@interface WFNewsViewController ()

@property(nonatomic,strong) UIBarButtonItem *facebookButton;
@property(nonatomic,strong) UIImageView *newsImage;
@property(nonatomic,strong) UIScrollView *newsScrollView;
@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) WFCustomTextView *bodyTextView;
@property(nonatomic,strong) WFDayCellLabel *headerLabel;
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
    self.headerLabel.text = self.facebookNewsViewModel.currentNews.headerDetail;

    NSLog(@"#### data url %@",self.facebookNewsViewModel.currentNews.dataUrl);
    NSLog(@"#### data title %@",self.facebookNewsViewModel.currentNews.dataTitle);

    [self.view addSubview:self.newsScrollView];
    [self.newsScrollView addSubview:self.contentView];
    [self.contentView addSubview:self.newsImage];
    [self.contentView addSubview:self.headerLabel];
    [self.contentView addSubview:self.bodyTextView];
}

- (UIImageView *)newsImage {
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _newsImage.contentMode = UIViewContentModeScaleAspectFill;
        _newsImage.clipsToBounds = YES;
    }
    return _newsImage;
}

- (WFDayCellLabel *)headerLabel {
    if(!_headerLabel) {
        _headerLabel = [[WFDayCellLabel alloc]initWithFrame:CGRectZero];
    }
    return _headerLabel;
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

    [self.headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.newsImage.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right);
    }];

    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.headerLabel.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right);
    }];
}

@end
