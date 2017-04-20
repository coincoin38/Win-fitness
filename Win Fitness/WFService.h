//
//  WFService.h
//  Win Fitness
//
//  Created by julien gimenez on 20/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveObjC.h>

typedef void (^WFServiceHandler)(id result,NSError *error);

@interface WFService : NSObject

@end
