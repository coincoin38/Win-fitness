//
//  ViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFViewController.h"
#import <ReactiveObjC.h>

@interface WFViewController ()

@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;

@end

@implementation WFViewController

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel
{
    self = [super init];
    if (self ) {
        _facebookNewsViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    [self setupView];
}

- (void)setupView
{
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * newLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 75, 200, 25)];
    RAC(newLabel,text) = RACObserve(self.facebookNewsViewModel, firstNewsTitle);
    [self.view addSubview:newLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
