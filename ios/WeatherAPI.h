//
//  WeatherAPI.h
//  AwesomeProject
//
//  Created by Insight on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//
@class WeatherClass;
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherAPI : NSObject<RCTBridgeModule>

@property(nonatomic,retain) WeatherClass* weatherClass;
// call swift
// get the object ( or error)
// then map it to a dinctionary and reutrn to the call back.
@end

NS_ASSUME_NONNULL_END
