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
#import "WFSessionsViewModel.h"
#import "WFNewsListViewController.h"
#import "WFSessionsListViewController.h"
#import "WFSessionsServices.h"

@interface AppDelegate ()

@property (nonatomic, retain) UINavigationController *newsNavigationController;
@property (nonatomic, retain) UINavigationController *sessionsNavigationController;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) WFFacebookServices *facebookServices;
@property (strong, nonatomic) WFSessionsServices *sessionsServices;

@property (strong, nonatomic) WFFacebookNewsViewModel *facebookNewsViewModel;
@property (strong, nonatomic) WFSessionsViewModel *sessionsViewModel;

@end

@implementation AppDelegate

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    [self createUI];
    return YES;
}

- (void)createUI {
    self.newsNavigationController = [self customNavigationController];
    self.newsNavigationController.viewControllers = [NSArray arrayWithObjects:[self createInitialViewController], nil];

    self.sessionsNavigationController = [self customNavigationController];
    self.sessionsNavigationController.viewControllers = [NSArray arrayWithObjects:[self createSessionViewController], nil];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:self.newsNavigationController,self.sessionsNavigationController,nil];
    self.tabBarController.tabBar.translucent = YES;
    self.tabBarController.tabBar.barTintColor = [UIColor darkGrayWF];
    self.tabBarController.tabBar.tintColor = [UIColor orangeWF];

    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:WFLocalisedString(@"NEWS")];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setTitle:WFLocalisedString(@"SESSIONS")];

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
}

- (UINavigationController *)customNavigationController {
    UINavigationController *customNC = [UINavigationController new];
    customNC.navigationBar.translucent = YES;
    customNC.navigationBar.tintColor = [UIColor orangeWF];
    customNC.navigationBar.barTintColor = [UIColor darkGrayWF];
    [customNC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeWF]}];
    return customNC;
}
- (UIViewController *)createInitialViewController {
    self.facebookServices = [[WFFacebookServices alloc] initService];
    self.facebookNewsViewModel = [[WFFacebookNewsViewModel alloc] initWithFacebookServices:self.facebookServices];
    return [[WFNewsListViewController alloc] initWithFacebookNewsViewModel:self.facebookNewsViewModel];
}

- (UIViewController *)createSessionViewController {
    self.sessionsServices = [[WFSessionsServices alloc] init];
    self.sessionsViewModel = [[WFSessionsViewModel alloc] initWithSessionsServices:self.sessionsServices];
    return [[WFSessionsListViewController alloc] initWithSessionsViewModel:self.sessionsViewModel];
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
