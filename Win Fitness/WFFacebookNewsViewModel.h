//
//  WFFacebookNewsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseViewModel.h"

@class WFFacebookFeedModel;
@class WFFacebookServices;
@class WFNewsTableViewCell;

@interface WFFacebookNewsViewModel : WFBaseViewModel

@property (nonatomic, strong) NSArray<WFFacebookFeedModel *> *facebookNews;
@property (nonatomic, strong) NSString *newsDetails;
@property (nonatomic, strong) RACCommand *newsCommand;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) WFFacebookFeedModel *currentNews;
@property (nonatomic) BOOL isLoading;

- (instancetype)initWithFacebookServices:(WFFacebookServices *)services;

- (void)startNewsDownload:(WFResultHandler)handler;
- (void)startNewsImageDownloadForCell:(WFNewsTableViewCell *)cell;
- (void)openFacebookURL;

@end
