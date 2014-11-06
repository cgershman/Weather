//
//  CityWeatherService.h
//  Weather
//
//  Created by Christopher Gershman on 11/5/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CityWeatherService : NSObject


+ (void)weatherForCity:(NSString *)city withCompletion:(void (^)(NSDictionary *response, NSError *error))completion;


@end
