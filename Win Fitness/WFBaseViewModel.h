//
//  WFBaseViewModel.h
//  Win Fitness
//
//  Created by julien gimenez on 19/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface WFBaseViewModel : NSObject

typedef void (^WFResultHandler)(id result,NSError *error);

@end
