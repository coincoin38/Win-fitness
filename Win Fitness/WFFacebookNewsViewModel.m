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

@interface WFFacebookNewsViewModel ()

@property (nonatomic, strong) WFFacebookServices *services;

@end

@implementation WFFacebookNewsViewModel

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services {
    self = [super init];
    if (self) {
        _services = services;
        [self startNewsFeed:^(id result __unused, NSError *error __unused) {}];
    }
    return self;
}

- (void)startNewsFeed:(WFFacebookHandler)handler {
    @weakify(self)
    [[self.executeGetNews execute:self]subscribeNext:^(id  _Nullable news) {
        @strongify(self)
        self.facebookNews = news;
        handler(news,nil);
    }];
}

- (void)createNewsDetail:(WFFacebookHandler)handler {
    @weakify(self)
    [[self.executeSetNewsDetails execute:self]subscribeNext:^(id  _Nullable newsDetail) {
        @strongify(self)
        self.newsDetails = newsDetail;
        handler(newsDetail,nil);
    }];
}

- (RACCommand *)executeGetNews {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self executeGetNewsSignal];
    }];
}

- (RACCommand *)executeSetNewsDetails {
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self executeGetNewsDetailsSignal];
    }];
}

- (RACSignal *)executeGetNewsSignal {
    return [[self.services newsGetSignal]deliverOnMainThread];
}

- (RACSignal *)executeGetNewsDetailsSignal {
    return [[self.services detailsNewsGetSignal:self.currentNews]deliverOnMainThread];
}

@end
