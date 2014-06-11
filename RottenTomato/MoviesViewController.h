//
//  MoviesViewController.h
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface MoviesViewController : UITableViewController

- (void)requestMovieData;

@property (nonatomic, weak) NSString* dataSource;

@end
