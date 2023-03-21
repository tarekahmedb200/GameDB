//
//  Rating.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import Foundation

struct Rating: Codable {
    let id: Int
    let title: String
    let count: Int
    let percent: Double
}
