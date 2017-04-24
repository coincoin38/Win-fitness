//
//  WFDaySessionsViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseListViewController.h"

@class WFSessionsDayViewModel;

@interface WFDaySessionsListViewController : WFBaseListViewController

- (instancetype)initWithSessionsDayViewModel:(WFSessionsDayViewModel *)viewModel;

@end
