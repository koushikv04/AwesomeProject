//
//  AwesomeProject.swift
//  AwesomeProject
//
//  Created by Insight on 2/17/20.
//  Copyright © 2020 Facebook. All rights reserved.
//



let API_KEY = "42c1df6242c99d85e6234a6e7e20bae5"
let openWeatherRequestString = "http://api.openweathermap.org/data/2.5/weather?q=Dublin,IE&appid=\(API_KEY)&units=metric"

import Foundation
import Alamofire


@objc(AwesomeProject)
class AwesomeProject:NSObject {
  
  @objc
  func fetchWeatherData(_ callback:@escaping RCTResponseSenderBlock) {
   let networkManager =  Alamofire.NetworkReachabilityManager(host: "www.google.com")!
    if networkManager.isReachable {
    Alamofire.request(openWeatherRequestString).responseJSON{response in
      if response.result.isSuccess {
        guard let responseData = response.result.value as? [String:Any] else {
          callback([NSNull()])
          return
        }
        callback([responseData])
      }
      else {
        callback([NSNull()])
      }
    }
  }
    else {
      callback([NSNull()])

    }
  }
}
