//
//  WFDownloadImageService.h
//  Win Fitness
//
//  Created by julien gimenez on 07/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFService.h"

@class WFFacebookFeedModel;
@class WFNewsTableViewCell;

@interface WFDownloadImageService : WFService

+ (void)downloadImage:(NSString *)urlString forCell:(WFNewsTableViewCell *)cell forNews:(WFFacebookFeedModel *)newsws;

@end
