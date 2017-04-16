//
//  WFFacebookNewsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDownloadImageService.h"
#import "WFErrorsServices.h"
#import "WFFacebookFeedModel+Additions.h"
#import "WFFacebookNewsViewModel.h"
#import "WFFacebookServices.h"
#import "WFNewsTableViewCell.h"

@class WFBaseListViewController;

@interface WFFacebookNewsViewModel ()

@property (nonatomic, strong) WFFacebookServices *services;

@end

@implementation WFFacebookNewsViewModel

#pragma mark - Init

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services {
    self = [super init];
    if (self) {
        _services = services;
        _isLoading = YES;
        [self startNewsDownload];
    }
    return self;
}

#pragma mark - Start processes

- (void)startNewsDownload {
    @weakify(self)
    [[self.newsCommand execute:self]subscribeNext:^(id news) {
        @strongify(self)
        [self checkResultDownload:news];
    }];
}

- (void)startNewsDownload:(WFFacebookHandler)handler {
    @weakify(self)
    if(!self.isLoading) {
        [[self.newsCommand execute:self]subscribeNext:^(id news) {
            @strongify(self)
            [self checkResultDownload:news];
            handler(news,nil);
        }];
    }
    else {
        handler(nil,nil);
    }
}

- (void)checkResultDownload:(id)news {
    self.isLoading = NO;
    if ([news isKindOfClass:[NSError class]]) {
        [self errorDownloadFacebookNews];
    }
    else {
        self.facebookNews = news;
    }
}

- (void)startNewsImageDownloadForCell:(WFNewsTableViewCell *)cell {
    if (cell.facebookModel.downloadedPicture) {
        cell.newsImage.image = cell.facebookModel.downloadedPicture;
    }
    else{
        if (cell.facebookModel.full_picture) {
            [WFDownloadImageService downloadImage:cell.facebookModel.full_picture
                                          forCell:cell
                                          forNews:cell.facebookModel];
        }
        else{
            cell.newsImage.image = [UIImage imageNamed:@"logo_winfitness"];
        }
    }
}

- (void)openFacebookURL {
    if ([self canOpenFacebookURL]) {
        [[UIApplication sharedApplication] openURL:self.currentNews.dataURL
                                           options:@{}
                                 completionHandler:^(BOOL success) {
                                     if ([NSNumber numberWithBool:success] == 0) {
                                         [self errorOpenFacebookURL];
                                     }
                                 }];
    }
    else{
        [self errorOpenFacebookURL];
    }
}

- (BOOL)canOpenFacebookURL {
    return [[UIApplication sharedApplication] canOpenURL:self.currentNews.dataURL];
}

#pragma mark - Commands

- (RACCommand *)newsCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self newsSignal];
    }];
}

#pragma mark - Signals

- (RACSignal *)newsSignal {
    return [[self.services newsServiceSignal]deliverOnMainThread];
}

#pragma mark - Errors

- (void)errorOpenFacebookURL {
    [self.currentViewController presentViewController:[WFErrorsServices errorOpenFacebookURL] animated:YES completion:nil];
    self.isLoading = NO;
}

- (void)errorDownloadFacebookNews {
    [self.currentViewController presentViewController:[WFErrorsServices errorDownloadFacebookNews] animated:YES completion:nil];
    self.isLoading = NO;
}

@end
