//
//  WFSessionsListViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFWeekSessionsListViewController.h"
#import "WFSessionsWeekViewModel.h"
#import "WFWeekSessionsTableViewCell.h"
#import "WFDaySessionModel.h"
#import "WFDaySessionsViewController.h"
#import "WFSessionsDayViewModel.h"
#import "WFSportsServices.h"

@interface WFWeekSessionsListViewController ()

@property(nonatomic,strong) WFSessionsWeekViewModel *viewModel;
@property(nonatomic,strong) WFSessionsDayViewModel *sessionsDayViewModel;

@property(nonatomic) float cellSize;

@end

@implementation WFWeekSessionsListViewController

#pragma mark - Init

- (instancetype)initWithSessionsViewModel:(WFSessionsWeekViewModel *)viewModel {
    self = [super init];

    if (self) {
        _viewModel = viewModel;
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
    [self.tableView registerClass:[WFWeekSessionsTableViewCell class] forCellReuseIdentifier:cellWeekSessionsIdentifier];
    self.tableView.scrollEnabled = NO;
    self.tableView.alwaysBounceVertical = NO;
    self.cellSize = (self.view.frame.size.height - 20 - (self.tabBarController.tabBar.frame.size.height))/6;

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
    
    RAC(self,datasArray) = RACObserve(self.viewModel, sessionsWeek);
    RAC(self.loadindActivityIndicator,animating) = RACObserve(self.viewModel,isLoading);
    
    [RACObserve(self, datasArray)
     subscribeNext:^(id sessions) {
         @strongify(self)
         if (sessions) {
             [self reloadTableView];
         }
     }];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WFWeekSessionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellWeekSessionsIdentifier forIndexPath:indexPath];
    [cell setupCellWithModel:(WFDaySessionModel *)self.datasArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.sessionsDayViewModel = [[WFSessionsDayViewModel alloc]initWithSportsServices:[WFSportsServices new]
                                                                         withSessions:(WFDaySessionModel *)self.datasArray[indexPath.row]];
    WFDaySessionsViewController * dayViewController = [[WFDaySessionsViewController alloc]initWithSessionsDayViewModel:self.sessionsDayViewModel];
    [self.navigationController pushViewController:dayViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellSize;
}

@end
