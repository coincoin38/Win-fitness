//
//  WFErrorsServices.h
//  Win Fitness
//
//  Created by julien gimenez on 13/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFService.h"

@interface WFErrorsServices : WFService

+ (UIAlertController *)errorOpenFacebookURL;
+ (UIAlertController *)errorDownloadFacebookNews;

@end
