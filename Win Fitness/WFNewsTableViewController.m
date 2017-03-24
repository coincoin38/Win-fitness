//
//  WFNewsTableViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 02/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsTableViewController.h"
#import "WFFacebookNewsViewModel.h"
#import "WFFacebookFeedModel.h"
#import "WFNewsTableViewCell.h"
#import "WFDownloadImageService.h"
#import "WFNewsViewController.h"

static NSString * const identifier = @"newsIdentifier";

@interface WFNewsTableViewController ()

@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;

@end

@implementation WFNewsTableViewController

#pragma mark - Init

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel {
    self = [super init];
    
    if (self) {
        _facebookNewsViewModel = viewModel;
        [self.tableView registerClass:[WFNewsTableViewCell class] forCellReuseIdentifier:identifier];
        [self bindViewModel];
        self.title = NSLocalizedString(@"NEWS", nil);
    }
    return self;
}

#pragma mark - Binding

- (void)bindViewModel {
    @weakify(self)

    RAC(self,datasArray) = RACObserve(self.facebookNewsViewModel, facebookNews);

    [RACObserve(self, datasArray)
     subscribeNext:^(id news) {
         @strongify(self)

         if (news) {
             if ([self.loadindActivityIndicator isAnimating]) {
                 [self.loadindActivityIndicator stopAnimating];
             }
             [self reloadTableView];
         }
     }];

    [[self.dataRefreshControl rac_signalForControlEvents:UIControlEventValueChanged]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self);
         [self.facebookNewsViewModel start:^(id result, NSError *error) {
             [self.dataRefreshControl endRefreshing];
         }];
     }];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WFFacebookFeedModel *news = (WFFacebookFeedModel *)self.datasArray[indexPath.row];
    WFNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell setupCellWithModel:news];
    [WFDownloadImageService downloadImage:news.full_picture forCell:cell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WFFacebookFeedModel *news = (WFFacebookFeedModel *)self.datasArray[indexPath.row];
    WFNewsViewController * newsViewController = [[WFNewsViewController alloc]initWithNews:news];
    [self.navigationController pushViewController:newsViewController animated:YES];
}

@end
