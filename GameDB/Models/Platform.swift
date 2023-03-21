//
//  Platform.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import Foundation



struct Platform: Codable , Identifiable {
    var id = UUID()
    let platform: PlatformDetails
 
    enum CodingKeys: String, CodingKey {
        case platform
    }
}

struct PlatformDetails: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
