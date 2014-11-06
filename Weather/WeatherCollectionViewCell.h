//
//  WeatherCollectionViewCell.h
//  Weather
//
//  Created by Christopher Gershman on 11/6/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"


@interface WeatherCollectionViewCell : UICollectionViewCell

- (void)setupWeather:(Weather *)weather;


@end
