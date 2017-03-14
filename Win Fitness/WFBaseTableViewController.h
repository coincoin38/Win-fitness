//
//  WFBaseTableViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 03/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC.h>
#import <Masonry/Masonry.h>

@interface WFBaseTableViewController : UITableViewController

@property(nonatomic,strong) NSArray *datasArray;
@property(nonatomic,strong) UIActivityIndicatorView *loadindActivityIndicator;
@property(nonatomic,strong) UIRefreshControl *dataRefreshControl;

@end
