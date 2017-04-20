//
//  WFDaySessionModel+Additions.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDaySessionModel.h"

@interface WFDaySessionModel (Additions)

- (NSArray *)mondaySessions;
- (NSArray *)tuesdaySessions;
- (NSArray *)wednesdaySessions;
- (NSArray *)thursdaySessions;
- (NSArray *)firdaySessions;
- (NSArray *)saturdaySessions;

- (NSArray *)mondayRPMSessions;
- (NSArray *)tuesdayRPMSessions;
- (NSArray *)wednesdayRPMSessions;
- (NSArray *)thursdayRPMSessions;
- (NSArray *)firdayRPMSessions;
- (NSArray *)saturdayRPMSessions;

- (NSArray *)weekSessions;
- (NSArray *)weekRPMSessions;

- (NSString *)dayString;

@end
