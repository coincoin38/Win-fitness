//
//  WFFacebookNewsViewModel.m
//  Win Fitness
//
//  Created by julien gimenez on 01/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDownloadImageService.h"
#import "WFFacebookFeedModel+Additions.h"
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
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"ERROR", nil)
                                                                    message:NSLocalizedString(@"COULD NOT OPEN URL", nil)
                                                             preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action){
                                                         [alert dismissViewControllerAnimated:YES completion:nil];
                                                     }];

    [alert addAction:okAction];
    [self.currentViewController presentViewController:alert animated:YES completion:nil];
}

@end
