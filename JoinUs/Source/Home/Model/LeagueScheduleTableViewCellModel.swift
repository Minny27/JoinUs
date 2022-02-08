//
//  ScheduleModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

struct LeagueScheduleTableViewCellModel {
    let leagueImage: String
    let league: String
    let year: String
    let month: String
    let date: String
    let time: String
    let status: String
    let versus: String
    let homeTeamId: Int
    let homeTeam: String
    let homeTeamImageUrl: URL
    let awayTeamId: Int
    let awayTeam: String
    let awayTeamImageUrl: URL
    let homeTeamWinCount: Int
    let awayTeamWinCount: Int
    let winnerId: Int?
    
    init(
        leagueImage: String,
        league: String,
        year: String,
        month: String,
        date: String,
        time: String,
        status: String,
        versus: String,
        homeTeamId: Int,
        homeTeam: String,
        homeTeamImageUrl: URL,
        awayTeamId: Int,
        awayTeam: String,
        awayTeamImageUrl: URL,
        homeTeamWinCount: Int,
        awayTeamWinCount: Int,
        winnerId: Int?
    ) {
        self.leagueImage = leagueImage
        self.league = league
        self.year = year
        self.month = month
        self.date = date
        self.time = time
        self.status = status
        self.versus = versus
        self.homeTeamId = homeTeamId
        self.homeTeam = homeTeam
        self.homeTeamImageUrl = homeTeamImageUrl
        self.awayTeamId = awayTeamId
        self.awayTeam = awayTeam
        self.awayTeamImageUrl = awayTeamImageUrl
        self.homeTeamWinCount = homeTeamWinCount
        self.awayTeamWinCount = awayTeamWinCount
        self.winnerId = winnerId
    }
}
