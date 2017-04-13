//
//  WFFacebookNewsViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@class WFFacebookFeedModel;
@class WFFacebookServices;
@class WFNewsTableViewCell;

typedef void (^WFFacebookHandler)(id result,NSError *error);

@interface WFFacebookNewsViewModel : NSObject

@property (nonatomic, strong) NSArray<WFFacebookFeedModel *> *facebookNews;
@property (nonatomic, strong) NSString *newsDetails;
@property (nonatomic, strong) RACCommand *newsCommand;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) WFFacebookFeedModel *currentNews;

- (instancetype)initWithFacebookServices:(WFFacebookServices *)services;

- (void)startNewsDownload:(WFFacebookHandler)handler;
- (void)startNewsImageDownloadForCell:(WFNewsTableViewCell *)cell;
- (void)openFacebookURL;

@end
