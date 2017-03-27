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
@property(nonatomic,strong) WFFacebookFeedModel *selectedNews;

@end

@implementation WFNewsTableViewController

#pragma mark - Init

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel {
    self = [super init];
    
    if (self) {
        _facebookNewsViewModel = viewModel;
    }
    return self;
}

- (void)setupViews {
    [self.tableView registerClass:[WFNewsTableViewCell class] forCellReuseIdentifier:identifier];
    self.title = NSLocalizedString(@"NEWS", nil);
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"BACK", nil)
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundView = self.loadindActivityIndicator;
    [self.tableView addSubview:self.dataRefreshControl];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self setupViews];
    [self bindViewModel];
}

#pragma mark - Binding

- (void)bindViewModel {
    @weakify(self)

    RAC(self,datasArray) = RACObserve(self.facebookNewsViewModel, facebookNews);
    RAC(self.facebookNewsViewModel,currentNews) = RACObserve(self, selectedNews);
    
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
         [self.facebookNewsViewModel startNewsFeed:^(id result, NSError *error) {
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
    self.selectedNews = (WFFacebookFeedModel *)self.datasArray[indexPath.row];
    WFNewsViewController * newsViewController = [[WFNewsViewController alloc]initWithFacebookNewsViewModel:self.facebookNewsViewModel];
    [self.navigationController pushViewController:newsViewController animated:YES];
}

@end
