//
//  ScheduleModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

struct ScheduleTableViewCellModel {
    let leagueImage: String
    let league: String
    let date: String
    let time: String
    let status: String
    let versus: String
    let homeTeamId: Int
    let homeTeam: String
    let homeTeamImage: Data
    let awayTeamId: Int
    let awayTeam: String
    let awayTeamImage: Data
    let homeTeamWinCount: Int
    let awayTeamWinCount: Int
    let winnerId: Int?
    
    init(leagueImage: String, league: String, date: String, time: String, status: String, versus: String, homeTeamId: Int, homeTeam: String, homeTeamImage: Data, awayTeamId: Int, awayTeam: String, awayTeamImage: Data, homeTeamWinCount: Int, awayTeamWinCount: Int, winnerId: Int?) {
        self.leagueImage = leagueImage
        self.league = league
        self.date = date
        self.time = time
        self.status = status
        self.versus = versus
        self.homeTeamId = homeTeamId
        self.homeTeam = homeTeam
        self.homeTeamImage = homeTeamImage
        self.awayTeamId = awayTeamId
        self.awayTeam = awayTeam
        self.awayTeamImage = awayTeamImage
        self.homeTeamWinCount = homeTeamWinCount
        self.awayTeamWinCount = awayTeamWinCount
        self.winnerId = winnerId
    }
}
