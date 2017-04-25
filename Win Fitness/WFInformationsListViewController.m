//
//  WFInformationsListViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFInformationsListViewController.h"
#import "WFInformationsViewModel.h"

@interface WFInformationsListViewController ()

@property(nonatomic,strong) WFInformationsViewModel *informationsViewModel;

@end

@implementation WFInformationsListViewController

- (instancetype)initWithInformationsViewModel:(WFInformationsViewModel *)viewModel {
    self = [super init];

    if (self) {
        _informationsViewModel = viewModel;
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
