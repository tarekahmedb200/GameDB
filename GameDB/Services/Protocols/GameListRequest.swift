//
//  GameListRequest.swift
//  GameDB
//
//  Created by lapshop on 2/25/23.
//

import Foundation


import Foundation

struct GameListRequest: RequestProtocol {
 
  var gameGenreID: Int
  var searchText : String
    
  var path: String {
     return "/api/games"
  }
    
  var urlParams: [String: String?] {
      var urlParams = ["genres":"\(gameGenreID)"]
      urlParams["key"] = "\(APIConstants.clientSecret)"
      
      if !(searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
          urlParams["search"] = searchText
      }
      
      return urlParams
  }
    
  var requestType: RequestType {
    .GET
  }
    
}
