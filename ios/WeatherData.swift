//
//  WeatherData.swift
//  AwesomeProject
//
//  Created by Insight on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit

@objc class WeatherData:NSObject {
  
  
  var id:Int?
  var cod:Int?
  var weather:[Any]?
  var sys:[String:Any]?
  var name:String?
  var main:[String:Any]?
  var message:String?
  
  @objc func convertToDictionary() -> [String:Any] {
    var dataDictionary = [String:Any]()
    dataDictionary["id"] = id
    dataDictionary["cod"] = cod
    dataDictionary["weather"] = weather
    dataDictionary["sys"] = sys
    dataDictionary["name"] = name
    dataDictionary["main"] = main
    dataDictionary["message"] = message

    return dataDictionary
  }
}

