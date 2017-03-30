//
//  NSString+Additions.m
//  Win Fitness
//
//  Created by julien gimenez on 30/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (NSString *)removeNewlines {
    return [[self componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@" "];
}

@end
