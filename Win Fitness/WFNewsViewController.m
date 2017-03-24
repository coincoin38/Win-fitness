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
#import "WFCustomTextView.h"

@interface WFNewsViewController ()

@property(nonatomic,strong) WFCustomTextView *bodyTextView;
@property(nonatomic,strong) UIImageView *newsImage;
@property(nonatomic,strong) WFFacebookFeedModel *news;

@end

@implementation WFNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [WFDownloadImageService downloadImage:self.news.full_picture forUIImageView:self.newsImage];
    self.bodyTextView.text = self.news._description;
    
    [self setupView];
    [self setupConstraints];
}

- (UIImageView *)newsImage {
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _newsImage.contentMode = UIViewContentModeScaleAspectFill;
        _newsImage.clipsToBounds = YES;
    }
    return _newsImage;
}

- (UITextView *)bodyTextView {
    if (!_bodyTextView) {
        _bodyTextView = [[WFCustomTextView alloc]initWithFrame:CGRectZero];
    }
    return _bodyTextView;
}


- (void)setupView {
    [self.view addSubview:self.newsImage];
    [self.view addSubview:self.bodyTextView];
}

- (void)setupConstraints {
    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
        make.right.equalTo(self.view.mas_right);
    }];

    [self.bodyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(5);
        make.top.equalTo(self.newsImage.mas_bottom).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithNews:(WFFacebookFeedModel *)news {
    self = [super init];

    if (self) {
        _news = news;
    }
    return self;
}

@end
