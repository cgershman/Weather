//
//  CityWeatherViewController.m
//  Weather
//
//  Created by Christopher Gershman on 11/5/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import "CityWeatherViewController.h"
#import "CityWeatherService.h"
#import "CurrentCityWeather.h"
#import "Weather.h"
#import "TemperatureConverter.h"
#import "WeatherCollectionViewCell.h"

#define kWeatherCollectionViewCellWidth 100.0f
#define kFahrenheitTemperatureFormat @"%0.0f°F"


@interface CityWeatherViewController () <UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UITextField *cityNameTextField;
@property (nonatomic, weak) IBOutlet UIButton *citySearchButton;

@property (nonatomic, weak) IBOutlet UIView *weatherView;
@property (nonatomic, weak) IBOutlet UILabel *cityLabel;
@property (nonatomic, weak) IBOutlet UILabel *temperatureLabel;
@property (nonatomic, weak) IBOutlet UILabel *minTemperatureLabel;
@property (nonatomic, weak) IBOutlet UILabel *maxTemperatureLabel;
@property (nonatomic, weak) IBOutlet UICollectionView *weatherCollectionView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *weatherCollectionWidthConstraint;

@property (nonatomic, strong) CurrentCityWeather *currentCityWeather;


@end


@implementation CityWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weatherView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCurrentCityWeather {
    if (self.currentCityWeather.cod == 404) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"CityWeatherViewController.error.citynotfound.title", nil) message:NSLocalizedString(@"CityWeatherViewController.error.citynotfound.message", nil)
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"Button.OK.title", nil)
                          otherButtonTitles:nil, nil] show];
        return;
    } else if (self.currentCityWeather.cod != 200) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"CityWeatherViewController.error.unknown.title", nil) message:NSLocalizedString(@"CityWeatherViewController.error.unknown.message", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"Button.OK.title", nil) otherButtonTitles:nil, nil] show];
        return;
    }
    
    self.cityLabel.text = self.currentCityWeather.city;
    self.temperatureLabel.text = [NSString stringWithFormat:kFahrenheitTemperatureFormat, [TemperatureConverter kelvinToFahrenheit:self.currentCityWeather.temperatureKelvin]];
    self.minTemperatureLabel.text = [NSString stringWithFormat:kFahrenheitTemperatureFormat, [TemperatureConverter kelvinToFahrenheit:self.currentCityWeather.lowTemperatureKelvin]];
    self.maxTemperatureLabel.text = [NSString stringWithFormat:kFahrenheitTemperatureFormat, [TemperatureConverter kelvinToFahrenheit:self.currentCityWeather.highTemperatureKelvin]];
    
    self.weatherCollectionWidthConstraint.constant = self.currentCityWeather.weather.count * kWeatherCollectionViewCellWidth;
    [self.weatherCollectionView reloadData];
    
    self.weatherView.hidden = NO;
}

#pragma mark - IBActions

- (IBAction)citySearchButtonTouchUpInside:(id)sender {
    NSString *city = self.cityNameTextField.text;
    city = [city stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (city != nil && city.length > 0) {
        __weak typeof(self)weakSelf = self;
        [CityWeatherService weatherForCity:city withCompletion:^(NSDictionary *response, NSError *error) {
            if (error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"CityWeatherViewController.error.unknown.title", nil) message:NSLocalizedString(@"CityWeatherViewController.error.unknown.message", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"Button.OK.title", nil) otherButtonTitles:nil, nil] show];
                });
            } else {
                self.currentCityWeather = [MTLJSONAdapter modelOfClass:CurrentCityWeather.class fromJSONDictionary:response error:NULL];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf showCurrentCityWeather];
                });
            }
        }];
    }
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCollectionViewCell *cell = [self.weatherCollectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(WeatherCollectionViewCell.class) forIndexPath:indexPath];
    
    [cell setupWeather:self.currentCityWeather.weather[indexPath.row]];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.currentCityWeather.weather.count;
}


@end
