//
//  WeatherData.swift
//  AwesomeProject
//
//  Created by Insight on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit

@objc class WeatherData:NSObject {
  
  
  var id:Int
  var cod:Int
  var weather:[Any]
  var sys:[String:Any]
  var name:String
  var main:[String:Any]
  var message:String
  
  init(id:Int,code:Int,weather:[Any],sys:[String:Any],name:String,main:[String:Any],message:String) {
    self.id = id
    self.cod = code
    self.weather = weather
    self.sys = sys
    self.name = name
    self.main = main
    self.message = message
  }
  
  convenience init(response:[String:Any]) {
    
    self.init(id:response["id"] as! Int,code:(response["cod"] as? Int)!,weather:(response["weather"] as? [Any])!,sys:(response["sys"] as? [String:Any])!,name:(response["name"] as? String)!,main:(response["main"] as? [String:Any])!,message:"")
  }
  
  convenience init(failedResponse response:[String:Any]) {
    self.init(id:0,code:response["cod"] as! Int,weather:[],sys:[:],name:"",main:[:],message:response["message"] as! String)
  }
 
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

