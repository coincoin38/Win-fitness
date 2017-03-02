//
//  ViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFFacebookNewsViewModel.h"

@interface WFViewController : UIViewController

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel;

@end

