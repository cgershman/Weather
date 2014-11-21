//
//  WeatherCollectionViewCell.m
//  Weather
//
//  Created by Christopher Gershman on 11/6/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import "WeatherCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

#define kWeatherForCityUrl @"http://openweathermap.org/img/w/%@.png"


@interface WeatherCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *weatherLabel;
@property (nonatomic, weak) IBOutlet UIImageView *weatherIcon;


@end


@implementation WeatherCollectionViewCell

- (void)setupWeather:(Weather *)weather {
    self.weatherLabel.text = weather.name;
    self.weatherIcon.image = nil;
    
    if (weather.icon && weather.icon.length > 0) {
        
        NSURL *iconURL = [NSURL URLWithString:[NSString stringWithFormat:kWeatherForCityUrl, weather.icon]];
        [self.weatherIcon setImageWithURL:iconURL];
    }

}


@end
