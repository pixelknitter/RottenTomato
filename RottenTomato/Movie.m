//
//  Movie.m
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (self) {
    self.title = dictionary[@"title"];
    self.mpaaRating = dictionary[@"mpaa_rating"];
    self.runtime = [dictionary[@"runtime"] integerValue];
    self.synopsis = dictionary[@"synposis"];
    self.year = dictionary[@"year"];
    
    self.releaseDates = dictionary[@"release_dates"];
    self.ratings = dictionary[@"ratings"];
    self.abridgedCast = dictionary[@"abridge_cast"];
    self.posters = dictionary[@"posters"];
  }
  
  return self;
}

+ (NSArray *)moviesWithArray:(NSArray *)array {
  NSMutableArray *movies = [[NSMutableArray alloc] init];
  
  for (NSDictionary *dictionary in array) {
    Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
    [movies addObject:movie];
  }
  
  return movies;
}

@end
