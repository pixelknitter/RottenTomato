//
//  CastMember.h
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CastMember : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *characters;
@property (nonatomic) NSInteger castID;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)castWithArray:(NSArray *)array;

@end
