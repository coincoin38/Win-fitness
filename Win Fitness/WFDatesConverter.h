//
//  WFDatesConverter.h
//  Win Fitness
//
//  Created by julien gimenez on 21/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFDatesConverter : NSObject

+ (NSString *)formatddMMMMHHmmFromDateString:(NSString *)dateString;
+ (NSString *)formatddMMFromDateString:(NSString *)dateString;

@end
