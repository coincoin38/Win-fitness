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
#import "WFFullSessionsModel.h"

@implementation WFDaySessionModel (Additions)

- (WFFullSessionsModel *)weekFullSessions {
    return [[WFFullSessionsModel alloc]initWithMillsSessions:[self millsSessions] withRpmSessions:[self rpmSessions]];
}

- (NSArray *)millsSessions {
    return @[[[WFDaySessionModel alloc]initWithArrayOfHours:self.mondayMillsSessions withDay:Monday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.tuesdayMillsSessions withDay:Tuesday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.wednesdayMillsSessions withDay:Wednesday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.thursdayMillsSessions withDay:Thursday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.firdayMillsSessions withDay:Friday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.saturdayMillsSessions withDay:Saturday]];
}

- (NSArray *)rpmSessions {
    return @[[[WFDaySessionModel alloc]initWithArrayOfHours:self.mondayRPMSessions withDay:Monday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.tuesdayRPMSessions withDay:Tuesday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.wednesdayRPMSessions withDay:Wednesday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.thursdayRPMSessions withDay:Thursday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.firdayRPMSessions withDay:Friday],
             [[WFDaySessionModel alloc]initWithArrayOfHours:self.saturdayRPMSessions withDay:Saturday]];
}

- (NSArray *)mondayMillsSessions {
    return [WFJSONReader JSONFromFile:kMonday].allValues;
}

- (NSArray *)tuesdayMillsSessions {
    return [WFJSONReader JSONFromFile:kThuesday].allValues;
}

- (NSArray *)wednesdayMillsSessions {
    return [WFJSONReader JSONFromFile:kWednesday].allValues;
}

- (NSArray *)thursdayMillsSessions {
    return [WFJSONReader JSONFromFile:kThursday].allValues;
}

- (NSArray *)firdayMillsSessions {
    return [WFJSONReader JSONFromFile:kFriday].allValues;
}

- (NSArray *)saturdayMillsSessions {
    return [WFJSONReader JSONFromFile:kSaturday].allValues;
}

- (NSArray *)mondayRPMSessions {
    return [WFJSONReader JSONFromFile:kMondayRPM].allValues;
}

- (NSArray *)tuesdayRPMSessions {
    return [WFJSONReader JSONFromFile:kThuesdayRPM].allValues;
}

- (NSArray *)wednesdayRPMSessions {
    return [WFJSONReader JSONFromFile:kWednesdayRPM].allValues;
}

- (NSArray *)thursdayRPMSessions {
    return [WFJSONReader JSONFromFile:kThursdayRPM].allValues;
}

- (NSArray *)firdayRPMSessions {
    return [WFJSONReader JSONFromFile:kFridayRPM].allValues;
}

- (NSArray *)saturdayRPMSessions {
    return [WFJSONReader JSONFromFile:kSaturdayRPM].allValues;
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
