//
//  WFNewsViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewController.h"

@class WFFacebookFeedModel;

@interface WFNewsViewController : WFBaseViewController

- (instancetype)initWithNews:(WFFacebookFeedModel *)news;

@end
