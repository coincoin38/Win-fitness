//
//  WFSessionsListViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsListViewController.h"

@interface WFSessionsListViewController ()

@property(nonatomic,strong) WFSessionsViewModel *sessionsListViewModel;

@end

@implementation WFSessionsListViewController

- (instancetype)initWithSessionsViewModel:(WFSessionsViewModel *)viewModel {
    self = [super init];

    if (self) {
        _sessionsListViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setupViews {

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:self.tableView];
}

@end
