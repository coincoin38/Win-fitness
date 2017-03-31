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

- (NSString *)dataTitle {
    return [self.data valueForKey:@"title"][0];
}

- (NSString *)dataUrl {
    return [self.data valueForKey:@"url"][0];
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

- (NSString *)headerDetail {
    NSString * headerText = NSLocalizedString(@"WIN FITNESS HAS ADDED", nil);

    if ([self.status_type isEqualToString:@"shared_story"]) {

    }

    if ([self.status_type isEqualToString:@"mobile_status_update"]) {

    }

    if ([self.status_type isEqualToString:@"added_photos"]) {

    }
    //////
    if ([self.type isEqualToString:@"link"]) {

    }

    if ([self.type isEqualToString:@"event"]) {

    }

    if ([self.type isEqualToString:@"video"]) {
        
    }

    if ([self.type isEqualToString:@"photo"]) {

    }

    if ([self.type isEqualToString:@"status"]) {

    }

    return [WFDatesConverter formatddMMMMHHmmFromDateString:self.created_time];
}

- (NSString *)bodyDetail {
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
        return NSLocalizedString(@"NO DESCRIPTION", nil);
    }
}

@end
