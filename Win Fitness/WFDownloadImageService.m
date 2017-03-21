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

@implementation WFDownloadImageService

+ (void)downloadImage:(NSString *)urlString forCell:(WFNewsTableViewCell *)cell
{
    __weak WFNewsTableViewCell *weakCell = cell;
    UIImage *defaultImage = [UIImage imageNamed:@"logo_winfitness"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    if (urlString)
    {
        [cell.newsImage setImageWithURLRequest:request
                              placeholderImage:defaultImage
                                       success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                                           weakCell.newsImage.image = image;
                                           [weakCell setNeedsLayout];
                                       } failure:nil];
    }
    else
    {
        cell.newsImage.image = defaultImage;
    }
}

@end
