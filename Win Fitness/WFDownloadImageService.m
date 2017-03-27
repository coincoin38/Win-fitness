//
//  WFDownloadImageService.m
//  Win Fitness
//
//  Created by julien gimenez on 07/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDownloadImageService.h"
#import "UIImageView+AFNetworking.h"
#import "WFNewsTableViewCell.h"
#import "WFFacebookFeedModel.h"

@implementation WFDownloadImageService

+ (void)downloadImage:(NSString *)urlString forCell:(WFNewsTableViewCell *)cell forNews:(WFFacebookFeedModel *)news {
    __weak WFNewsTableViewCell *weakCell = cell;
    __weak WFFacebookFeedModel *weakNews = news;

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [cell.newsImage setImageWithURLRequest:request
                              placeholderImage:[UIImage imageNamed:@"logo_winfitness"]
                                       success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                                           weakCell.newsImage.image = image;
                                           weakNews.downloadedPicture = image;
                                           [weakCell setNeedsLayout];
                                       } failure:nil];

}

@end
