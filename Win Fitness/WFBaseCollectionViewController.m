//
//  WFBaseCollectionViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseCollectionViewController.h"

@interface WFBaseCollectionViewController ()

@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;

@end

@implementation WFBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UICollectionView *)collectionView {
    if(!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout= [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.width/2);
        [_flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

- (void)addCustomStatusBar:(UIColor *)color {
    UIView *statusBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    statusBar.backgroundColor = color;
    statusBar.alpha = 0.9;
    [self.view addSubview:statusBar];
}

- (void)reloadCollectionView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView transitionWithView:self.collectionView
                          duration:0.25f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^(void) {
                            [self.collectionView reloadData];
                        } completion:NULL];
    });
}

#pragma mark - Table view data source & delegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.datasArray count];
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
