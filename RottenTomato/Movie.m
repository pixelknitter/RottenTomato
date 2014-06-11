//
//  Movie.m
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import "Movie.h"
#import "CastMember.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (self) {
    // Straight Values Yo
    self.title = dictionary[@"title"];
    self.mpaaRating = dictionary[@"mpaa_rating"];
    self.runtime = [dictionary[@"runtime"] integerValue];
    self.synopsis = dictionary[@"synopsis"];
    self.criticsConsensus = dictionary[@"critics_consensus"];
    self.year = dictionary[@"year"];
    
    // CastMembers Array
    self.abridgedCast = [CastMember castWithArray:dictionary[@"abridge_cast"]];
    
    // Dictionaries
    self.releaseDates = dictionary[@"release_dates"];
    self.ratings = dictionary[@"ratings"];
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
