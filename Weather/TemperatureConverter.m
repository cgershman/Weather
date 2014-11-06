//
//  TemperatureConverter.m
//  Weather
//
//  Created by Christopher Gershman on 11/6/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import "TemperatureConverter.h"


@implementation TemperatureConverter

+ (float)kelvinToCelsius:(float)kelvinTemperature {
    return kelvinTemperature - 273.15f;
}

+ (float)kelvinToFahrenheit:(float)kelvinTemperature {
    return [TemperatureConverter kelvinToCelsius:kelvinTemperature] * 1.8f + 32.0f;
}


@end
