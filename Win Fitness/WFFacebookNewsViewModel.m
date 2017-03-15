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

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services
{
    self = [super init];
    if (self) {
        _services = services;
        @weakify(self)
        [[self.executeGetNews execute:self]subscribeNext:^(id  _Nullable x) {
            @strongify(self)
            self.facebookNews = x;
        }];
    }
    return self;
}

- (RACCommand *)executeGetNews
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self executeGetNewsSignal];
    }];
}

- (RACSignal *)executeGetNewsSignal
{
    return [[self.services newsGetSignal]deliverOnMainThread];
}

@end
