//
//  WFDaySessionModel+Additions.m
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDaySessionModel+Additions.h"
#import "WFJSONReader.h"
#import "WFSessionsConstants.h"

@implementation WFDaySessionModel (Additions)

- (NSArray *)weekSessions {
    return @[[[WFDaySessionModel alloc]initWithArrayOfHours:self.mondaySessions withDay:Monday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.tuesdaySessions withDay:Tuesday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.wednesdaySessions withDay:Wednesday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.thursdaySessions withDay:Thursday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.firdaySessions withDay:Friday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.saturdaySessions withDay:Saturday]];
}

- (NSArray *)mondaySessions {
    return [WFJSONReader JSONFromFile:kMonday].allValues;
}

- (NSArray *)tuesdaySessions {
    return [WFJSONReader JSONFromFile:kThuesday].allValues;
}

- (NSArray *)wednesdaySessions {
    return [WFJSONReader JSONFromFile:kWednesday].allValues;
}

- (NSArray *)thursdaySessions {
    return [WFJSONReader JSONFromFile:kThursday].allValues;
}

- (NSArray *)firdaySessions {
    return [WFJSONReader JSONFromFile:kFriday].allValues;
}

- (NSArray *)saturdaySessions {
    return [WFJSONReader JSONFromFile:kSaturday].allValues;
}

- (NSString *)dayString {
    NSString *text = WFLocalisedString(@"EMPTY");

    switch (self.day) {
        case 0:
            text = WFLocalisedString(@"MONDAY");
            break;
        case 1:
            text = WFLocalisedString(@"TUESDAY");
            break;
        case 2:
            text = WFLocalisedString(@"WEDNESDAY");
            break;
        case 3:
            text = WFLocalisedString(@"THURSDAY");
            break;
        case 4:
            text = WFLocalisedString(@"FRIDAY");
            break;
        case 5:
            text = WFLocalisedString(@"SATURDAY");
            break;
    }
    return text;
}

@end
