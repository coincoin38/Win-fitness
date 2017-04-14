//
//  WFFacebookFeedModel+Additions.m
//  Win Fitness
//
//  Created by julien gimenez on 27/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "NSString+Additions.h"
#import "WFDatesConverter.h"
#import "WFFacebookFeedModel+Additions.h"

@implementation WFFacebookFeedModel (Additions)

- (NSURL *)dataURL {
    return [NSURL URLWithString:[self.data valueForKey:@"url"][0]] ? : nil;
}

- (NSString *)headerCell {
    if (self.name) {
        return [NSString stringWithFormat:@"%@, %@",[WFDatesConverter formatddMMFromDateString:self.created_time],self.name];
    }
    return [WFDatesConverter formatddMMMMHHmmFromDateString:self.created_time];
}

- (NSString *)bodyCell {
    return [self._description removeNewlines] ? : [self.message removeNewlines];
}

- (NSString *)headerDetailsTitle {
    if ([self.status_type isEqualToString:@"shared_story"]) {
        return [NSString stringWithFormat:@"%@ %@",
                      WFLocalisedString(@"WIN FITNESS HAS SHARED THE PUBLICATION OF"),
                      self.name];
    }
    return WFLocalisedString(@"WIN FITNESS HAS ADDED");
}

- (NSString *)headerDetailsDate {
    return [WFDatesConverter formatddMMMMHHmmFromDateString:self.created_time];
}

- (NSString *)bodyDetails {
    if (self._description && self.message) {
        return [NSString stringWithFormat:@"%@\n\n%@",self.message, self._description];
    }
    else if(self.message){
        return self.message;
    }
    else if(self._description){
       return self._description;
    }
    else{
        return WFLocalisedString(@"NO DESCRIPTION");
    }
}

@end
