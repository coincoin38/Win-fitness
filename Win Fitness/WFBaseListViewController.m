//
//  WFBaseTableViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 03/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseListViewController.h"

@interface WFBaseListViewController ()

@end

@implementation WFBaseListViewController

#pragma mark - Views

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
        _tableView.backgroundView = self.loadindActivityIndicator;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView addSubview:self.dataRefreshControl];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[WFNewsTableViewCell class] forCellReuseIdentifier:cellIdentifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIRefreshControl *)dataRefreshControl {
    if (!_dataRefreshControl) {
        _dataRefreshControl = [[UIRefreshControl alloc]initWithFrame:CGRectZero];
        _dataRefreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"PULL TO REFRESH", nil)];
    }
    return _dataRefreshControl;
}

- (UIActivityIndicatorView *)loadindActivityIndicator {
    if (!_loadindActivityIndicator) {
        _loadindActivityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectZero];
        _loadindActivityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        _loadindActivityIndicator.hidesWhenStopped = YES;
        [_loadindActivityIndicator startAnimating];
    }
    return _loadindActivityIndicator;
}

- (void)reloadTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView transitionWithView:self.tableView
                          duration:0.25f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^(void) {
                            [self.tableView reloadData];
                        } completion:NULL];
    });
}

- (void)addCustomStatusBar:(UIColor *)color {
    UIView *statusBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    statusBar.backgroundColor = color;
    [self.view addSubview:statusBar];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datasArray count];
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
