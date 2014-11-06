//
//  Weather.h
//  Weather
//
//  Created by Christopher Gershman on 11/6/14.
//  Copyright (c) 2014 Christopher Gershman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>


@interface Weather : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *weatherDescription;
@property (nonatomic, strong) NSString *icon;


@end
