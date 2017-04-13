//
//  WFErrorsServices.m
//  Win Fitness
//
//  Created by julien gimenez on 13/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFErrorsServices.h"

@implementation WFErrorsServices

+ (UIAlertController *)errorWithTitle:(NSString *)title withMessage:(NSString *)message withButtonTitle:(NSString *)buttonTitle {

    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title
                                                                    message:message
                                                             preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okAction = [UIAlertAction actionWithTitle:buttonTitle
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action){
                                                         [alert dismissViewControllerAnimated:YES completion:nil];
                                                     }];
    
    [alert addAction:okAction];
    return alert;
}

+ (UIAlertController *)errorOpenFacebookURL {
    return [self errorWithTitle:NSLocalizedString(@"ERROR", nil)
                    withMessage:NSLocalizedString(@"COULD NOT OPEN URL", nil)
                withButtonTitle:NSLocalizedString(@"OK", nil)];
}

+ (UIAlertController *)errorDownloadFacebookNews {
    return [self errorWithTitle:NSLocalizedString(@"ERROR", nil)
                    withMessage:NSLocalizedString(@"COULD NOT DOWNLOAD FACEBOOK NEWS", nil)
                withButtonTitle:NSLocalizedString(@"OK", nil)];
}

@end
