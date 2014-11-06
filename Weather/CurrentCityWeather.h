//
//  CurrentCityWeather.h
//  Weather
//
//  Created by Christopher Gershman on 11/6/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>


@interface CurrentCityWeather : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSInteger cod;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;
@property (nonatomic, assign) float temperatureKelvin;
@property (nonatomic, assign) float lowTemperatureKelvin;
@property (nonatomic, assign) float highTemperatureKelvin;
@property (nonatomic, assign) NSInteger pressure;
@property (nonatomic, assign) NSInteger humidity;
@property (nonatomic, strong) NSArray *weather;


@end
