//
//  WFNewsViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsDetailTextView.h"
#import "WFHeaderNewsDetailsTitleLabel.h"
#import "WFDownloadImageService.h"
#import "WFFacebookFeedModel+Additions.h"
#import "WFFacebookNewsViewModel.h"
#import "WFFooterButtonNewsDetails.h"
#import "WFNewsTableViewCell.h"
#import "WFNewsDetailsViewController.h"
#import "WFHeaderNewsDetailsDateLabel.h"

@interface WFNewsDetailsViewController ()

@property(nonatomic,strong) UIBarButtonItem *facebookButton;
@property(nonatomic,strong) UIImageView *newsImage;
@property(nonatomic,strong) UIScrollView *newsScrollView;
@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) UIView *bodyView;
@property(nonatomic,strong) WFNewsDetailTextView *bodyTextView;
@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;
@property(nonatomic,strong) WFFooterButtonNewsDetails *footerButton;
@property(nonatomic,strong) WFHeaderNewsDetailsTitleLabel *headerTitleLabel;
@property(nonatomic,strong) WFHeaderNewsDetailsDateLabel *headerDateLabel;

@end

@implementation WFNewsDetailsViewController

#pragma mark - Init

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel {
    self = [super init];
    
    if (self) {
        _facebookNewsViewModel = viewModel;
        _facebookNewsViewModel.currentViewController = self;
    }
    return self;
}

- (void)bindViewModel {
    RAC(self.newsImage,image) = RACObserve(self.facebookNewsViewModel, currentNews.downloadedPicture);

    @weakify(self)
    [[self.footerButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self)
         [self.facebookNewsViewModel openFacebookURL];
     }];
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupConstraints];
    [self bindViewModel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    self.navigationController.navigationBar.translucent = YES;
}

#pragma mark - User Interface Elements

- (void)setupView {
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.title = self.facebookNewsViewModel.currentNews.name;
    self.bodyTextView.text = self.facebookNewsViewModel.currentNews.bodyDetails;
    self.headerTitleLabel.text = self.facebookNewsViewModel.currentNews.headerDetailsTitle;
    self.headerDateLabel.text = self.facebookNewsViewModel.currentNews.headerDetailsDate;

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

- (WFHeaderNewsDetailsTitleLabel *)headerTitleLabel {
    if(!_headerTitleLabel) {
        _headerTitleLabel = [[WFHeaderNewsDetailsTitleLabel alloc]initWithFrame:CGRectZero
                                                            withName:self.facebookNewsViewModel.currentNews.name];
    }
    return _headerTitleLabel;
}

- (WFHeaderNewsDetailsDateLabel *)headerDateLabel {
    if(!_headerDateLabel) {
        _headerDateLabel = [[WFHeaderNewsDetailsDateLabel alloc]initWithFrame:CGRectZero
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

- (WFFooterButtonNewsDetails *)footerButton {
    if (!_footerButton) {
        _footerButton = [[WFFooterButtonNewsDetails alloc]initWithFrame:CGRectZero];
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
        make.top.equalTo(self.bodyView.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.height.equalTo(@30);
    }];
}

@end
