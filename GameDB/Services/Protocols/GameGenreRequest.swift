//
//  GameGenreRequest.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import Foundation

struct GameGenreRequest: RequestProtocol {
    
  var path: String {
    "/api/genres"
  }
    
  var urlParams: [String: String?] {
      return ["key":APIConstants.clientSecret]
  }
    
  var requestType: RequestType {
    .GET
  }
    
}
