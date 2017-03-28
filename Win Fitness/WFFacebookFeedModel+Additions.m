//
//  WFFacebookFeedModel+Additions.m
//  Win Fitness
//
//  Created by julien gimenez on 27/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFacebookFeedModel+Additions.h"

@implementation WFFacebookFeedModel (Additions)

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
