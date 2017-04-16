//
//  WFBaseTableViewController.h
//  Win Fitness
//
//  Created by julien gimenez on 03/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Masonry/Masonry.h>
#import <ReactiveObjC.h>
#import <UIKit/UIKit.h>
#import "WFNewsTableViewCell.h"
#import "UIColor+Additions.h"

static NSString * const cellNewsIdentifier = @"newsIdentifier";
static NSString * const cellSessionsDaysIdentifier = @"sessionsDaysIdentifier";

@interface WFBaseListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) NSArray *datasArray;
@property(nonatomic,strong) UIActivityIndicatorView *loadindActivityIndicator;
@property(nonatomic,strong) UIRefreshControl *dataRefreshControl;
@property(nonatomic,strong) UITableView *tableView;

- (void)reloadTableView;
- (void)addCustomStatusBar:(UIColor *)color;

@end
