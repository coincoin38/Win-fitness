//
//  WFJSONReader.m
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFJSONReader.h"

@implementation WFJSONReader

+ (NSDictionary *)JSONFromFile:(NSString *)file{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
