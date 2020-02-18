//
//  AwesomeProject.m
//  AwesomeProject
//
//  Created by Insight on 2/17/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(AwesomeProject, NSObject)
RCT_EXTERN_METHOD(fetchWeatherData:(RCTResponseSenderBlock)callback)
@end

