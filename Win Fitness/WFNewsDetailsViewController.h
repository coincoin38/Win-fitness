//
//  WFNewsViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewController.h"

@class WFFacebookNewsViewModel;

@interface WFNewsDetailsViewController : WFBaseViewController

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel;

@end
