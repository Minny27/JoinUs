//
//  Standings.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/25.
//

import Foundation

struct Standings {
    let ranking: String
    let teamImageUrl: URL
    let team: String
    let wins: String
    let loses: String
    let winRate: String
    let point: String
    
    init(
        ranking: String,
        teamImageUrl: URL,
        team: String,
        wins: String,
        loses: String,
        winRate: String,
        point: String
    ) {
        self.ranking = ranking
        self.teamImageUrl = teamImageUrl
        self.team = team
        self.wins = wins
        self.loses = loses
        self.winRate = winRate
        self.point = point
    }
}
