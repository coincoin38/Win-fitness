//
//  WFJSONReader.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFJSONReader : NSObject

+ (NSDictionary *)JSONFromFile:(NSString *)file;

@end
