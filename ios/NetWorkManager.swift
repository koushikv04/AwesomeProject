//
//  NetWorkManager.swift
//  AwesomeProject
//
//  Created by Insight on 2/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import Alamofire

let reachableServer = "www.google.com"

class NetworkManager {
  
  //function to fetch api response from give URL
  func fetchRESTData(forURL url: String, completionHandler:@escaping (_ response:[String:Any])->Void)  {
    
    //Check if network is reachable
    let networkManager =  Alamofire.NetworkReachabilityManager(host: reachableServer)!
       if networkManager.isReachable {
         
         Alamofire.request(url).responseJSON{response in
               if response.result.isSuccess {
                 guard let responseData = response.result.value as? [String:Any] else {
                   return
                 }
          //return response
         completionHandler(responseData)
                }
                       else {
                         print(response)
                       }
        }
       }
       else {
        
        //return json response if internet unavailable
         let response = "{\"cod\":0,\"message\":\"Internet connection unavailable,Please try again later\"}"
         if let data = response.data(using: .utf8) {
           do {
             
             if let responseJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
              print(responseJSON)
              completionHandler(responseJSON)
               
             }
           }
           catch {
             print(error.localizedDescription)
           }
         }

       }
}
  
//   this returns a closure with a JSON.
}
