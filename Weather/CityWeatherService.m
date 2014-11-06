//
//  CityWeatherService.m
//  Weather
//
//  Created by Christopher Gershman on 11/5/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import "CityWeatherService.h"
#import "AFHTTPRequestOperationManager.h"

#define kWeatherForCityUrl @"http://api.openweathermap.org/data/2.5/weather?q=%@"


@implementation CityWeatherService

+ (void)weatherForCity:(NSString *)city withCompletion:(void (^)(NSDictionary *response, NSError *error))completion {
    
    NSString *url = [NSString stringWithFormat:kWeatherForCityUrl, city];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:url
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             completion(responseObject, nil);
         }  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             completion(nil, error);
         }];
}


@end
