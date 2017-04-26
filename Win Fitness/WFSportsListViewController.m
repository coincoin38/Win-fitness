//
//  WFSportsListViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFSportCollectionViewCell.h"
#import "WFSportsListViewController.h"
#import "WFSportsViewModel.h"
#import "WFSportModel.h"

@interface WFSportsListViewController ()

@property(nonatomic,strong) WFSportsViewModel *viewModel;
@property(nonatomic,strong) WFSportModel *selectedSport;

@end

@implementation WFSportsListViewController

#pragma mark - Init

- (instancetype)initWithSportsViewModel:(WFSportsViewModel *)viewModel {
    self = [super init];

    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

#pragma mark - View Life Cycle

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
    [self.collectionView registerClass:[WFSportCollectionViewCell class]
            forCellWithReuseIdentifier:cellSportSessionsIdentifier];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self addCustomStatusBar:[UIColor darkGrayWF]];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Binding

- (void)bindViewModel {
    @weakify(self)

    RAC(self,datasArray) = RACObserve(self.viewModel, sportsList);
    RAC(self.viewModel,selectedSport) = RACObserve(self, selectedSport);

    [RACObserve(self, datasArray)
     subscribeNext:^(id news) {
         @strongify(self)
         if (news) {
             [self reloadCollectionView];
         }
     }];

    [RACObserve(self, selectedSport)
     subscribeNext:^(id sport) {
         @strongify(self)
         if(sport) {
             [self.viewModel startSportCompletionParsing];
         }
     }];
}

#pragma mark - Table view data source & delegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WFSportCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellSportSessionsIdentifier
                                                                                forIndexPath:indexPath];
    [cell setupCellWithModel:(WFSportModel *)self.datasArray[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedSport = self.datasArray[indexPath.row];
}

@end
