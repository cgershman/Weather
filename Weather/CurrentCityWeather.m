//
//  CurrentCityWeather.m
//  Weather
//
//  Created by Christopher Gershman on 11/6/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import "CurrentCityWeather.h"
#import "Weather.h"


@implementation CurrentCityWeather 

#pragma mark - mantle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"city" : @"name",
             @"latitude" : @"coord.lat",
             @"longitude" : @"coord.lon",
             @"temperatureKelvin" : @"main.temp",
             @"pressure" : @"main.pressure",
             @"humidity" : @"main.humidity",
             @"lowTemperatureKelvin" : @"main.temp_min",
             @"highTemperatureKelvin" : @"main.temp_max"
             };
}

+ (NSValueTransformer *)weatherJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:Weather.class];
}


@end
