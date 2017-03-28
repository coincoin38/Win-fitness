//
//  WFFacebookNewsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFacebookNewsViewModel.h"
#import "WFFacebookFeedModel.h"
#import "WFFacebookServices.h"
#import <ReactiveObjC.h>
#import "WFDownloadImageService.h"

@interface WFFacebookNewsViewModel ()

@property (nonatomic, strong) WFFacebookServices *services;

@end

@implementation WFFacebookNewsViewModel

#pragma mark - Init

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services {
    self = [super init];
    if (self) {
        _services = services;
        [self startNewsDownload];
    }
    return self;
}

#pragma mark - Start processes

- (void)startNewsDownload {
    @weakify(self)
    [[self.newsCommand execute:self]subscribeNext:^(id  _Nullable news) {
        @strongify(self)
        self.facebookNews = news;
    }];
}

- (void)startNewsDownload:(WFFacebookHandler)handler {
    @weakify(self)
    [[self.newsCommand execute:self]subscribeNext:^(id  _Nullable news) {
        @strongify(self)
        self.facebookNews = news;
        handler(news,nil);
    }];
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

- (void)startNewsDetailCreation {
    @weakify(self)
    [[self.newsDetailsCommand execute:self]subscribeNext:^(id  _Nullable newsDetail) {
        @strongify(self)
        self.newsDetails = newsDetail;
    }];
}

#pragma mark - Commands

- (RACCommand *)newsCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self newsSignal];
    }];
}

- (RACCommand *)newsDetailsCommand {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self newsDetailsSignal];
    }];
}

#pragma mark - Signals

- (RACSignal *)newsSignal {
    return [[self.services newsGetSignal]deliverOnMainThread];
}

- (RACSignal *)newsDetailsSignal {
    return [[self.services detailsNewsGetSignal:self.currentNews]deliverOnMainThread];
}

@end
