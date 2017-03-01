//
//  WFFacebookNewsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFacebookNewsViewModel.h"
#import "WFFacebookFeedModel.h"
#import "WFFaceBookServices.h"
#import <ReactiveObjC.h>

@interface WFFacebookNewsViewModel ()

@property (nonatomic, strong) WFFacebookServices *services;

@end

@implementation WFFacebookNewsViewModel

- (instancetype) initWithFacebookServices:(WFFacebookServices *)services{
    
    self = [super init];
    if (self) {
        _services = services;
        _firstNewsTitle = @"coucou";
        
        [_services grabNews:^(id news, NSError *error) {
            if (news) {
                
                NSDictionary *dictionary = (NSDictionary *)news;
                NSMutableArray<WFFacebookFeedModel *> *newsArray = [NSMutableArray new];
                
                for (NSDictionary * newDictionary in dictionary[@"data"]) {
                    WFFacebookFeedModel * newModel = [[WFFacebookFeedModel alloc]initWithDictionary:newDictionary];
                    [newsArray addObject:newModel];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    _firstNewsTitle = newsArray[0].message;
                    NSLog(@"message %@",newsArray[0]._description);

                });
                
                NSLog(@"newsArray %@",newsArray);
            }
            else{
                NSLog(@"error news %@",error);
            }
        }];
    }
    return self;
}

- (RACCommand *)executeGetNews
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return  [self executeGetNewsSignal];
    }];
}

- (RACSignal *)executeGetNewsSignal
{
    return [[self.services newsGetSignal]deliverOnMainThread];
}

@end
