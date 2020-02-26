//
//  WeatherClass.swift
//  AwesomeProject
//
//  Created by Insight on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit

@objc public class WeatherClass: NSObject {
  let API_KEY = "42c1df6242c99d85e6234a6e7e20bae5"
  
    @objc static let sharedInstance = WeatherClass()

  private override init() {
    
  }
   // rewrite to return a WeatherData response in the closure. Get JSON response from
   // NetworkManager and parse to a WeatherData object. Remove RCTResponseSenderBlock and create your own closure.
   typealias handler = @convention(block)(_ response:WeatherData) -> ()
  
  //Function to fetch weather data using openweather api
  @objc
  func fetchWeatherData(location:String,completionHandler:@escaping handler ) {
      let openWeatherRequestString = "http://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(API_KEY)&units=metric"
     let networkManager = NetworkManager()
     networkManager.fetchRESTData(forURL: openWeatherRequestString) { (responseData) in
      if responseData["cod"] as? Int == 200 {
        let weatherData = WeatherData(response: responseData)
        completionHandler(weatherData)
      }
      else {
        let weatherData = WeatherData(failedResponse: responseData)
        completionHandler(weatherData)
      }
     }
  }


}
