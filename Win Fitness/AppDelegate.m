//
//  AppDelegate.m
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "AppDelegate.h"
#import "UIColor+Additions.h"
#import "WFFacebookServices.h"
#import "WFFacebookNewsViewModel.h"
#import "WFNewsTableViewController.h"


@interface AppDelegate ()

@property (nonatomic, retain) UINavigationController *navigationController;
@property (strong, nonatomic) WFFacebookServices *facebookServices;
@property (strong, nonatomic) WFFacebookNewsViewModel *facebookNewsViewModel;

@end

@implementation AppDelegate

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    self.navigationController = [UINavigationController new];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor orangeWF];
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayWF];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayWF]}];
    
    UIViewController *viewController = [self createInitialViewController];
    [self.navigationController pushViewController:viewController animated:NO];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UIViewController *)createInitialViewController {
    self.facebookServices = [[WFFacebookServices alloc] initService];
    self.facebookNewsViewModel = [[WFFacebookNewsViewModel alloc] initWithFacebookServices:self.facebookServices];
    
    return [[WFNewsTableViewController alloc] initWithFacebookNewsViewModel:self.facebookNewsViewModel];
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

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}

@end
