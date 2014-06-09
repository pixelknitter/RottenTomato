//
//  Movie.h
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *year;
@property (nonatomic) NSInteger runtime;
@property (nonatomic, strong) NSString *mpaaRating;
@property (nonatomic, strong) NSDictionary *posters;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSDictionary *releaseDates;
@property (nonatomic, strong) NSDictionary *ratings;
@property (nonatomic, strong) NSArray *abridgedCast;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithArray:(NSArray *)array;

@end
