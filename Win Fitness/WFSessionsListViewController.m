//
//  WFSessionsListViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSessionsListViewController.h"
#import "WFSessionsViewModel.h"
#import "WFSessionsTableViewCell.h"
#import "WFDaySessionModel.h"

@interface WFSessionsListViewController ()

@property(nonatomic,strong) WFSessionsViewModel *sessionsViewModel;
@property(nonatomic,strong) WFDaySessionModel *selectedDay;
@property(nonatomic) float cellSize;

@end

@implementation WFSessionsListViewController

#pragma mark - Init

- (instancetype)initWithSessionsViewModel:(WFSessionsViewModel *)viewModel {
    self = [super init];

    if (self) {
        _sessionsViewModel = viewModel;
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
    [self.tableView registerClass:[WFSessionsTableViewCell class] forCellReuseIdentifier:cellSessionsDaysIdentifier];
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
    
    RAC(self,datasArray) = RACObserve(self.sessionsViewModel, sessionsDays);
    RAC(self.sessionsViewModel,currentSessionsDay) = RACObserve(self, selectedDay);
    RAC(self.loadindActivityIndicator,animating) = RACObserve(self.sessionsViewModel,isLoading);
    
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
    WFSessionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellSessionsDaysIdentifier forIndexPath:indexPath];
    [cell setupCellWithModel:(WFDaySessionModel *)self.datasArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedDay = (WFDaySessionModel *)self.datasArray[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellSize;
}

@end
