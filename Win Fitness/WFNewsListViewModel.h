//
//  WFNewsListViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@class WFFacebookFeedModel;
@class WFFacebookServices;
@class WFNewsTableViewCell;

typedef void (^WFFacebookHandler)(id result,NSError *error);

@interface WFNewsListViewModel : NSObject

@property (nonatomic, strong) NSArray<WFFacebookFeedModel *> *facebookNews;
@property (nonatomic, strong) RACCommand *newsCommand;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) WFFacebookFeedModel *currentNews;
@property (nonatomic) BOOL isLoading;

- (instancetype)initWithFacebookServices:(WFFacebookServices *)services;

- (void)startNewsDownload:(WFFacebookHandler)handler;
- (void)startNewsImageDownloadForCell:(WFNewsTableViewCell *)cell;

@end
