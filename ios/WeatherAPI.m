//
//  WeatherAPI.m
//  AwesomeProject
//
//  Created by Insight on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "WeatherAPI.h"
#import "AwesomeProject-Swift.h"
#import <React/RCTLog.h>

@implementation WeatherAPI

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(fetchWeatherData:(NSString *)location callback:(RCTResponseSenderBlock)callback)
{
  self.weatherClass = WeatherClass.sharedInstance;
  
  [self.weatherClass fetchWeatherDataWithLocation:location completionHandler:^(WeatherData * data) {
    
    NSDictionary* responseDictionary = [data convertToDictionary];
    RCTLogInfo(@"%@",responseDictionary);
    callback(@[responseDictionary]);
  }];
  
}

@end
