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
@property (strong, nonatomic) UITabBarController *tabBarController;
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
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.tintColor = [UIColor orangeWF];
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayWF];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeWF]}];
    self.navigationController.viewControllers = [NSArray arrayWithObjects:[self createInitialViewController], nil];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:self.navigationController, nil];
    self.tabBarController.tabBar.translucent = YES;
    self.tabBarController.tabBar.barTintColor = [UIColor lightGrayWF];
    self.tabBarController.tabBar.tintColor = [UIColor darkGrayWF];


    self.window.rootViewController = self.tabBarController;
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
