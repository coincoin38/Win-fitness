//
//  WFSportsListViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 25/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseCollectionViewController.h"

@class WFSportsViewModel;

@interface WFSportsListViewController : WFBaseCollectionViewController

- (instancetype)initWithSportsViewModel:(WFSportsViewModel *)viewModel;

@end
