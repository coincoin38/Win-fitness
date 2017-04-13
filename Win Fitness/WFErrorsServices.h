//
//  WFErrorsServices.h
//  Win Fitness
//
//  Created by julien gimenez on 13/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WFErrorsServices : NSObject

+ (UIAlertController *)errorOpenFacebookURL;
+ (UIAlertController *)errorDownloadFacebookNews;

@end
