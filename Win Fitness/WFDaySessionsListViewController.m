//
//  WFDaySessionsViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDaySessionsListViewController.h"
#import "WFDaySessionsTableViewCell.h"
#import "WFSessionModel.h"
#import "WFSessionsWeekViewModel.h"
#import "WFSessionsDayViewModel.h"
#import "WFDaySessionModel+Additions.h"

@interface WFDaySessionsListViewController ()

@property(nonatomic,strong) WFSessionsDayViewModel *viewModel;
@property(nonatomic,strong) WFSessionModel *selectedSession;
@end

@implementation WFDaySessionsListViewController

- (instancetype)initWithSessionsDayViewModel:(WFSessionsDayViewModel *)viewModel {
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
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)setupViews {
    self.navigationItem.title = self.viewModel.daySessions.dayString;
    [self.tableView registerClass:[WFDaySessionsTableViewCell class] forCellReuseIdentifier:cellDaysSessionsIdentifier];

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

    RAC(self,datasArray) = RACObserve(self.viewModel, daySessions.sessions);

    [RACObserve(self, datasArray)
     subscribeNext:^(id news) {
         @strongify(self)
         if (news) {
             [self reloadTableView];
         }
     }];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WFDaySessionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDaysSessionsIdentifier
                                                                       forIndexPath:indexPath];
    [cell setupCellWithModel:self.datasArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedSession = (WFSessionModel *)self.datasArray[indexPath.row];
}

@end
