//
//  GameDetailsRequest.swift
//  GameDB
//
//  Created by lapshop on 2/25/23.
//

import Foundation

struct GameDetailsRequest: RequestProtocol {
 
  var gameid: Int
    
  var path: String {
     return "/api/games/\(gameid)"
  }
    
  var urlParams: [String: String?] {
     return  ["key":APIConstants.clientSecret]
  }
    
  var requestType: RequestType {
    .GET
  }
    
}

