//
//  WFFaceBookServices.h
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^WFFacebookHandler)(id result,NSError *error);

@interface WFFaceBookServices : NSObject

- (void)generateToken:(WFFacebookHandler)handler;
- (void)grabNews:(NSString *)token :(WFFacebookHandler)handler;

@end
