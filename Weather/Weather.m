//
//  Weather.m
//  Weather
//
//  Created by Christopher Gershman on 11/6/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import "Weather.h"


@implementation Weather

#pragma mark - mantle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"main",
             @"weatherDescription" : @"description"
             };
}


@end
