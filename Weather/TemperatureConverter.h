//
//  TemperatureConverter.h
//  Weather
//
//  Created by Christopher Gershman on 11/6/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TemperatureConverter : NSObject

+ (float)kelvinToCelsius:(float)kelvinTemperature;
+ (float)kelvinToFahrenheit:(float)kelvinTemperature;


@end
