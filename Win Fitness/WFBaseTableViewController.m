//
//  WFBaseTableViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 03/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseTableViewController.h"

@interface WFBaseTableViewController ()

@end

@implementation WFBaseTableViewController

#pragma mark - Views

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundView = self.loadindActivityIndicator;
    [self.tableView addSubview:self.dataRefreshControl];
}

- (UIRefreshControl *)dataRefreshControl
{
    if (!_dataRefreshControl)
    {
        _dataRefreshControl = [[UIRefreshControl alloc]initWithFrame:CGRectZero];
    }

    return _dataRefreshControl;
}

- (UIActivityIndicatorView *)loadindActivityIndicator
{
    if (!_loadindActivityIndicator)
    {
        _loadindActivityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectZero];
        _loadindActivityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        _loadindActivityIndicator.hidesWhenStopped = YES;
        [_loadindActivityIndicator startAnimating];
    }
    
    return _loadindActivityIndicator;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.datasArray count];
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
