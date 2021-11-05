//
//  Game.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/05.
//

import Foundation

struct Game: Codable {
    var finished: Bool
    var id: Int?
    var winner: Winner
}
