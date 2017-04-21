//
//  WFDaySessionModel+Additions.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDaySessionModel.h"

@class WFFullSessionsModel;

@interface WFDaySessionModel (Additions)

- (NSArray *)mondayMillsSessions;
- (NSArray *)tuesdayMillsSessions;
- (NSArray *)wednesdayMillsSessions;
- (NSArray *)thursdayMillsSessions;
- (NSArray *)firdayMillsSessions;
- (NSArray *)saturdayMillsSessions;

- (NSArray *)mondayRPMSessions;
- (NSArray *)tuesdayRPMSessions;
- (NSArray *)wednesdayRPMSessions;
- (NSArray *)thursdayRPMSessions;
- (NSArray *)firdayRPMSessions;
- (NSArray *)saturdayRPMSessions;

- (NSArray *)millsSessions;
- (NSArray *)rpmSessions;
- (WFFullSessionsModel *)weekFullSessions;

- (NSString *)dayString;



@end
