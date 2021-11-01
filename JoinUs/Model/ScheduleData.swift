//
//  ScheduleData.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/30.
//

import Foundation

struct ScheduleData: Codable {
    var data: ScheduleService
}

struct ScheduleService: Codable {
    var schedule: Schedule
}

struct Schedule: Codable {
    var updated: Date?
    var pages: Page
    var events: [Event]
}

struct Page: Codable {
    var older: String?
    var newer: String?
}

struct Event: Codable {
    var blockName: String
    var league: LeagueData
    var match: MatchData
    var startTime: Date
    var state: String
    var type: String
}

struct LeagueData: Codable {
    var name: String
    var slug: String
}

struct MatchData: Codable {
    var flags: [String]
    var id: String
    var strategy: StrategyData
    var teams: [TeamData]
}

struct StrategyData: Codable {
    var count: Double
    var type: String
}

struct TeamData: Codable {
    var code: String
    var image: String
    var name: String
    var result: ResultData?
    var record: RecordData?
}

struct ResultData: Codable {
    var gameWins: Double
    var outcome: String?
}

struct RecordData: Codable {
    var losses: Double
    var wins: Double
}


