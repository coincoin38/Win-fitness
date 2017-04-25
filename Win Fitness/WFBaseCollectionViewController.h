//
//  WFBaseCollectionViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Masonry/Masonry.h>
#import <ReactiveObjC.h>
#import <UIKit/UIKit.h>
#import "UIColor+Additions.h"

static NSString * const cellSportSessionsIdentifier = @"sportSessionsIdentifier";

@interface WFBaseCollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic,strong) NSArray *datasArray;
@property(nonatomic,strong) UICollectionView *collectionView;

- (void)reloadCollectionView;
- (void)addCustomStatusBar:(UIColor *)color;

@end
