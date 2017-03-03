//
//  WFNewsTableViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 02/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//
#import "WFBaseTableViewController.h"

@class WFFacebookNewsViewModel;

@interface WFNewsTableViewController : WFBaseTableViewController

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel;

@end
