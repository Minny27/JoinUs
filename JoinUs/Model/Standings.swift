//
//  Standings.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/25.
//

import Foundation

struct Standings {
    let ranking: String
    let teamImage: Data
    let team: String
    let wins: String
    let loses: String
    let winRate: String
    let point: String
    
    init(ranking: String, teamImage: Data, team: String, wins: String, loses: String, winRate: String, point: String) {
        self.ranking = ranking
        self.teamImage = teamImage
        self.team = team
        self.wins = wins
        self.loses = loses
        self.winRate = winRate
        self.point = point
    }
}
