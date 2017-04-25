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
#import "WFInformationsViewModel.h"

#import "WFNewsListViewController.h"
#import "WFWeekSessionsListViewController.h"
#import "WFSportsListViewController.h"
#import "WFInformationsListViewController.h"

#import "WFFacebookServices.h"
#import "WFSessionsServices.h"
#import "WFSportsServices.h"
#import "WFInformationsServices.h"

@interface WFAppDelegate ()

@property (nonatomic, retain) UINavigationController *newsNavigationController;
@property (nonatomic, retain) UINavigationController *sessionsNavigationController;
@property (nonatomic, retain) UINavigationController *sportsNavigationController;
@property (nonatomic, retain) UINavigationController *informationsNavigationController;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) WFFacebookServices *facebookServices;
@property (strong, nonatomic) WFSessionsServices *sessionsServices;
@property (strong, nonatomic) WFSportsServices *sportsServices;
@property (strong, nonatomic) WFInformationsServices *informationsServices;

@property (strong, nonatomic) WFFacebookNewsViewModel *facebookNewsViewModel;
@property (strong, nonatomic) WFSessionsWeekViewModel *sessionsViewModel;
@property (strong, nonatomic) WFSportsViewModel *sportsViewModel;
@property (strong, nonatomic) WFInformationsViewModel *informationsViewModel;

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

    self.informationsNavigationController = [self customNavigationController];
    self.informationsNavigationController.viewControllers = [NSArray arrayWithObjects:[self createInformationsViewController], nil];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
                                             self.newsNavigationController,
                                             self.sessionsNavigationController,
                                             self.sportsNavigationController,
                                             self.informationsNavigationController,
                                             nil];

    self.tabBarController.tabBar.translucent = YES;
    self.tabBarController.tabBar.barTintColor = [UIColor darkGrayWF];
    self.tabBarController.tabBar.tintColor = [UIColor orangeWF];

    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:WFLocalisedString(@"NEWS")];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setTitle:WFLocalisedString(@"SESSIONS")];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setTitle:WFLocalisedString(@"ACTIVITIES")];
    [[self.tabBarController.tabBar.items objectAtIndex:3] setTitle:WFLocalisedString(@"INFORMATIONS")];

    [[self.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"news"]];
    [[self.tabBarController.tabBar.items objectAtIndex:0] setSelectedImage:[UIImage imageNamed:@"news_selected"]];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"calendar"]];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setSelectedImage:[UIImage imageNamed:@"calendar_selected"]];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"activities"]];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setSelectedImage:[UIImage imageNamed:@"activities_selected"]];
    [[self.tabBarController.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"informations"]];
    [[self.tabBarController.tabBar.items objectAtIndex:3] setSelectedImage:[UIImage imageNamed:@"informations_selected"]];

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

- (UIViewController *)createInformationsViewController {
    self.informationsServices = [WFInformationsServices new];
    self.informationsViewModel = [[WFInformationsViewModel alloc]initWithInformationsServices:self.informationsServices];
    return [[WFInformationsListViewController alloc] initWithInformationsViewModel:self.informationsViewModel];
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
