//
//  WFDatesConverter.m
//  Win Fitness
//
//  Created by julien gimenez on 21/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDatesConverter.h"

@implementation WFDatesConverter

+ (NSString *)formatddMMMMHHmmFromDateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'+'0000";
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    dateFormatter.dateFormat = @"dd MMMM, HH:mm";
    dateFormatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"fr_BI"];

    return [dateFormatter stringFromDate:dateFromString];
}

+ (NSString *)formatddMMFromDateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'+'0000";
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    dateFormatter.dateFormat = @"dd/MM";
    dateFormatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"fr_BI"];

    return [dateFormatter stringFromDate:dateFromString];
}
@end
