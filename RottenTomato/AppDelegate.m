//
//  AppDelegate.m
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "MoviesViewController.h"


static NSString * const BaseURLString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/";
DataSource moviesSource;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  
  // Set Data Source
  NSString *dataSourceString = @"";
  
  switch (moviesSource) {
    case BoxOffice:
      dataSourceString = @"movies/box_office.json";
      break;
    case TopRentals:
      dataSourceString = @"dvds/top_rentals.json";
      break;
    case Search:
      dataSourceString = @"movies.json";
      break;
    default:
      dataSourceString = @"movies/box_office.json";
      break;
  }
  
  //  NSDictionary *parameters = @{@"apikey" : @"g9au4hv6khv6wzvzgt55gpqs"};
//  NSString *apiParameter = @"apikey=g9au4hv6khv6wzvzgt55gpqs";
//  NSString *urlString = [NSString stringWithFormat:@"%@%@?%@", BaseURLString, dataSourceString, apiParameter];
//  
//  // Create the two view controllers, each within a navigation controller
//  MoviesViewController *topRentalsViewController = [[MoviesViewController alloc] init];
//  UINavigationController *topRentalsNavigationController = [[UINavigationController alloc] initWithRootViewController:topRentalsViewController];
//  topRentalsNavigationController.tabBarItem.title = @"Top Rentals";
//  topRentalsNavigationController.tabBarItem.image = [UIImage imageNamed:@"House"];
//  
//  MoviesViewController *boxOfficeViewController = [[MoviesViewController alloc] init];
//  UINavigationController *boxOfficeNavigationController = [[UINavigationController alloc] initWithRootViewController:boxOfficeViewController];
//  boxOfficeNavigationController.tabBarItem.title = @"Box Office";
//  boxOfficeNavigationController.tabBarItem.image = [UIImage imageNamed:@"Martini"];
//  
//  // Configure the tab bar controller with the two navigation controllers
//  UITabBarController *tabBarController = [[UITabBarController alloc] init];
//  tabBarController.viewControllers = @[topRentalsNavigationController, boxOfficeNavigationController];
//  
//  self.window.rootViewController = tabBarController;
  
  
  //For Image caching that is used by AFNetworking
  NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
                                                       diskCapacity:200 * 1024 * 1024
                                                           diskPath:nil];
  [NSURLCache setSharedURLCache:URLCache];
  
  // Define View/Navigation Controllers
  MoviesViewController *vc = [[MoviesViewController alloc] init];
  vc.dataSource = dataSourceString;
  
  UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
  self.window.rootViewController = nvc;
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
