//
//  WFSportsListViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportsListViewController.h"
#import "WFSportsViewModel.h"

@interface WFSportsListViewController ()

@property(nonatomic,strong) WFSportsViewModel *viewModel;

@end

@implementation WFSportsListViewController

- (instancetype)initWithSportsViewModel:(WFSportsViewModel *)viewModel {
    self = [super init];

    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
