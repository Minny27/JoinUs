//
//  ScheduleData2.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/03.
//

import Foundation

struct ReceivedScheduleModel: Codable {
    var originalScheduledAt: Date
    var games: [Game]
    var id: Int?
    var league: League?
    var name: String?
    var numberOfGames: Int?
    var opponents: [Opponents]?
    var status: String?
    var winnerId: Int?
}


