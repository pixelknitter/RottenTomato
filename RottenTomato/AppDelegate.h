//
//  AppDelegate.h
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

typedef enum {
  TopRentals = 1,
  BoxOffice = 2,
  Search = 3
} DataSource;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
