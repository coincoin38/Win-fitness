//
//  AppDelegate.m
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "UIColor+Additions.h"
#import "WFAppDelegate.h"

#import "WFFacebookNewsViewModel.h"
#import "WFSessionsWeekViewModel.h"
#import "WFSportsViewModel.h"

#import "WFNewsListViewController.h"
#import "WFWeekSessionsListViewController.h"
#import "WFSportsListViewController.h"

#import "WFFacebookServices.h"
#import "WFSessionsServices.h"
#import "WFSportsServices.h"

@interface WFAppDelegate ()

@property (nonatomic, retain) UINavigationController *newsNavigationController;
@property (nonatomic, retain) UINavigationController *sessionsNavigationController;
@property (nonatomic, retain) UINavigationController *sportsNavigationController;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) WFFacebookServices *facebookServices;
@property (strong, nonatomic) WFSessionsServices *sessionsServices;
@property (strong, nonatomic) WFSportsServices *sportsServices;

@property (strong, nonatomic) WFFacebookNewsViewModel *facebookNewsViewModel;
@property (strong, nonatomic) WFSessionsWeekViewModel *sessionsViewModel;
@property (strong, nonatomic) WFSportsViewModel *sportsViewModel;


@end

@implementation WFAppDelegate

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
    self.newsNavigationController.viewControllers = [NSArray arrayWithObjects:[self createFacebookViewController], nil];

    self.sessionsNavigationController = [self customNavigationController];
    self.sessionsNavigationController.viewControllers = [NSArray arrayWithObjects:[self createSessionsViewController], nil];

    self.sportsNavigationController = [self customNavigationController];
    self.sportsNavigationController.viewControllers = [NSArray arrayWithObjects:[self createSportsViewController], nil];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
                                             self.newsNavigationController,
                                             self.sessionsNavigationController,
                                             self.sportsNavigationController,
                                             nil];
    self.tabBarController.tabBar.translucent = YES;
    self.tabBarController.tabBar.barTintColor = [UIColor darkGrayWF];
    self.tabBarController.tabBar.tintColor = [UIColor orangeWF];

    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:WFLocalisedString(@"NEWS")];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setTitle:WFLocalisedString(@"SESSIONS")];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setTitle:WFLocalisedString(@"ACTIVITIES")];

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
- (UIViewController *)createFacebookViewController {
    self.facebookServices = [[WFFacebookServices alloc] initService];
    self.facebookNewsViewModel = [[WFFacebookNewsViewModel alloc] initWithFacebookServices:self.facebookServices];
    return [[WFNewsListViewController alloc] initWithFacebookNewsViewModel:self.facebookNewsViewModel];
}

- (UIViewController *)createSessionsViewController {
    self.sessionsServices = [WFSessionsServices new];
    self.sessionsViewModel = [[WFSessionsWeekViewModel alloc] initWithSessionsServices:self.sessionsServices];
    return [[WFWeekSessionsListViewController alloc] initWithSessionsViewModel:self.sessionsViewModel];
}

- (UIViewController *)createSportsViewController {
    self.sportsServices = [WFSportsServices new];
    self.sportsViewModel = [[WFSportsViewModel alloc]initWithSportsServices:self.sportsServices];
    return [[WFSportsListViewController alloc] initWithSportsViewModel:self.sportsViewModel];
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