//
//  WFFacebookNewsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDownloadImageService.h"
#import "WFFacebookFeedModel.h"
#import "WFFacebookNewsViewModel.h"
#import "WFFacebookServices.h"
#import "WFNewsTableViewCell.h"

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

@end
