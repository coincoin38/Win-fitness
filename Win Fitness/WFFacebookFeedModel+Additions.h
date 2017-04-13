//
//  WFFacebookFeedModel+Additions.h
//  Win Fitness
//
//  Created by julien gimenez on 27/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFacebookFeedModel.h"

@interface WFFacebookFeedModel (Additions)

- (NSString *)headerDetailsTitle;
- (NSString *)headerDetailsDate;
- (NSString *)bodyDetails;
- (NSString *)bodyCell;
- (NSString *)headerCell;
- (NSURL *)dataURL;

@end
