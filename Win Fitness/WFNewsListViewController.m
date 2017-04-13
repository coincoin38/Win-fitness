//
//  WFNewsTableViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 02/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDownloadImageService.h"
#import "WFFacebookFeedModel.h"
#import "WFFacebookNewsViewModel.h"
#import "WFNewsListViewController.h"
#import "WFNewsDetailsViewController.h"

@interface WFNewsListViewController ()

@property(nonatomic,strong) WFFacebookFeedModel *selectedNews;
@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;

@end

@implementation WFNewsListViewController

#pragma mark - Init

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel {
    self = [super init];
    
    if (self) {
        _facebookNewsViewModel = viewModel;
        _facebookNewsViewModel.currentViewController = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self bindViewModel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setupViews {
    self.title = NSLocalizedString(@"NEWS", nil);
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self addCustomStatusBar:[UIColor darkGrayColor]];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Binding

- (void)bindViewModel {
    @weakify(self)

    RAC(self,datasArray) = RACObserve(self.facebookNewsViewModel, facebookNews);
    RAC(self.facebookNewsViewModel,currentNews) = RACObserve(self, selectedNews);
    RAC(self.loadindActivityIndicator,animating) = RACObserve(self.facebookNewsViewModel,isLoading);
    
    [RACObserve(self, datasArray)
     subscribeNext:^(id news) {
         @strongify(self)
         if (news) {
             [self reloadTableView];
         }
     }];

    [[self.dataRefreshControl rac_signalForControlEvents:UIControlEventValueChanged]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self);
         [self.facebookNewsViewModel startNewsDownload:^(id result, NSError *error) {
             [self.dataRefreshControl endRefreshing];
         }];
     }];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WFNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setupCellWithModel:(WFFacebookFeedModel *)self.datasArray[indexPath.row]];
    [self.facebookNewsViewModel startNewsImageDownloadForCell:cell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedNews = (WFFacebookFeedModel *)self.datasArray[indexPath.row];
    WFNewsDetailsViewController * newsViewController = [[WFNewsDetailsViewController alloc]initWithFacebookNewsViewModel:self.facebookNewsViewModel];
    [self.navigationController pushViewController:newsViewController animated:YES];
}

@end
