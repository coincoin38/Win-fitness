//
//  AppDelegate.m
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "WFFaceBookServices.h"
#import "WFFacebookFeedModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    WFFacebookServices *FBService = [WFFacebookServices new];
    [FBService grabNews:^(id news, NSError *error) {
        if (news) {
            
            NSDictionary *dictionary = (NSDictionary *)news;
            NSMutableArray<WFFacebookFeedModel *> *newsArray = [NSMutableArray new];
            
            for (NSDictionary * newDictionary in dictionary[@"data"]) {
                WFFacebookFeedModel * newModel = [[WFFacebookFeedModel alloc]initWithDictionary:newDictionary];
                [newsArray addObject:newModel];
            }
            NSLog(@"newsArray %@",newsArray);
        }
        else{
            NSLog(@"error news %@",error);
        }
    }];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
