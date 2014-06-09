//
//  CastMember.m
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import "CastMember.h"

@implementation CastMember

- (id)initWithDictionary:(NSDictionary *)dictionary {
  self = [super init];
  if (self) {
    self.name = dictionary[@"name"];
    self.characters = dictionary[@"characters"];
  }
  
  return self;
}

+ (NSArray *)castWithArray:(NSArray *)array {
  NSMutableArray *cast = [[NSMutableArray alloc] init];
  
  for (NSDictionary *dictionary in array) {
    CastMember *castMember = [[CastMember alloc] initWithDictionary:dictionary];
    [cast addObject:castMember];
  }
  
  return cast;
}

@end
