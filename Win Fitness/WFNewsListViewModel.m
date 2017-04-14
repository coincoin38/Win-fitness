//
//  WFNewsListViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsListViewModel.h"
#import "WFDownloadImageService.h"
#import "WFErrorsServices.h"
#import "WFFacebookFeedModel+Additions.h"
#import "WFFacebookServices.h"
#import "WFNewsTableViewCell.h"

@interface WFNewsListViewModel ()

@property (nonatomic, strong) WFFacebookServices *services;

@end

@implementation WFNewsListViewModel

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
    [[self.newsCommand execute:self]subscribeNext:^(id news) {
        @strongify(self)
        [self checkResultDownload:news];
        handler(news,nil);
    }];
}

- (void)checkResultDownload:(id)news {
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

- (void)errorDownloadFacebookNews {
    [self.currentViewController presentViewController:[WFErrorsServices errorDownloadFacebookNews] animated:YES completion:nil];
    self.isLoading = NO;
}

@end
