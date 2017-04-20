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

@property(nonatomic,strong) UIView *footerView;
@property(nonatomic,strong) UIImageView *footerImageView;
@property(nonatomic,strong) UILabel *footerLabel;


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

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];

    self.cellSize = (self.view.frame.size.height - 70 - (self.tabBarController.tabBar.frame.size.height))/6;

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self addCustomStatusBar:[UIColor darkGrayColor]];
    [self.view addSubview:self.footerView];
    [self.footerView addSubview:self.footerImageView];
    [self.footerView addSubview:self.footerLabel];

    [self setupConstraints];
}

- (void)setupConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.footerView.mas_top);
    }];

    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).offset(-self.tabBarController.tabBar.frame.size.height);
        make.height.equalTo(@50);
    }];

    [self.footerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.footerView.mas_top);
        make.left.equalTo(self.footerView.mas_left).offset(8);
        make.bottom.equalTo(self.footerView.mas_bottom);
        make.width.equalTo(@25);
    }];

    [self.footerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.footerView.mas_top);
        make.left.equalTo(self.footerImageView.mas_right).offset(8);
        make.right.equalTo(self.footerView.mas_right).offset(-5);
        make.bottom.equalTo(self.footerView.mas_bottom);
    }];
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectZero];
        _footerView.backgroundColor = [UIColor whiteColor];
    }
    return _footerView;
}

- (UIImageView *)footerImageView {
    if (!_footerImageView) {
        _footerImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _footerImageView.backgroundColor = [UIColor whiteColor];
        _footerImageView.image = [UIImage imageNamed:@"warning_alert_attention_search-64"];
        _footerImageView.contentMode = UIViewContentModeScaleAspectFit;
        _footerImageView.clipsToBounds = YES;
    }
    return _footerImageView;
}

- (UILabel *)footerLabel {
    if (!_footerLabel) {
        _footerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _footerLabel.backgroundColor = [UIColor whiteColor];
        _footerLabel.textAlignment = NSTextAlignmentJustified;
        _footerLabel.textColor = [UIColor darkGrayWF];
        _footerLabel.font = [UIFont systemFontOfSize:12];
        _footerLabel.numberOfLines = 0;
        _footerLabel.text = WFLocalisedString(@"PLANING MAY CHANGE");
    }
        return _footerLabel;
}

#pragma mark - Binding

- (void)bindViewModel {
    @weakify(self)
    
    RAC(self,datasArray) = RACObserve(self.viewModel, sessionsWeek);
    
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
