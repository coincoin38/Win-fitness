//
//  WFDownloadImageService.h
//  Win Fitness
//
//  Created by julien gimenez on 07/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WFNewsTableViewCell;

@interface WFDownloadImageService : NSObject

+ (void)downloadImage:(NSString *)urlString forCell:(WFNewsTableViewCell *)cell;

@end
