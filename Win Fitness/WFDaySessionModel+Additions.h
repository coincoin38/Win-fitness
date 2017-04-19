//
//  WFDaySessionModel+Additions.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFDaySessionModel.h"

@interface WFDaySessionModel (Additions)

- (NSArray *)weekSessions;
- (NSArray *)mondaySessions;
- (NSArray *)tuesdaySessions;
- (NSArray *)wednesdaySessions;
- (NSArray *)thursdaySessions;
- (NSArray *)firdaySessions;
- (NSArray *)saturdaySessions;
- (NSString *)dayString;

@end
