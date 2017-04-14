//
//  WFLocalizedString.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

static inline NSString *WFLocalisedString(NSString *str) {
    return NSLocalizedString(str, nil);
}
