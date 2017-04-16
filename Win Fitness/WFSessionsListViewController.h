//
//  WFSessionsListViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseListViewController.h"

@class WFSessionsViewModel;

@interface WFSessionsListViewController : WFBaseListViewController

- (instancetype)initWithSessionsViewModel:(WFSessionsViewModel *)viewModel;

@end
