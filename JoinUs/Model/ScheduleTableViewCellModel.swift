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
    let tournamentName: String
    let versus: String
    let homeTeam: String
    let homeTeamImage: String
    let awayTeam: String
    let awayTeamImage: String
    let homeTeamWinCount: Int
    let awayTeamWinCount: Int
    
    init(leagueImage: String, league: String, date: String, time: String, status: String, tournamentName: String, versus: String, homeTeam: String, homeTeamImage: String, awayTeam: String, awayTeamImage: String, homeTeamWinCount: Int, awayTeamWinCount: Int) {
        self.leagueImage = leagueImage
        self.league = league
        self.date = date
        self.time = time
        self.status = status
        self.tournamentName = tournamentName
        self.versus = versus
        self.homeTeam = homeTeam
        self.homeTeamImage = homeTeamImage
        self.awayTeam = awayTeam
        self.awayTeamImage = awayTeamImage
        self.homeTeamWinCount = homeTeamWinCount
        self.awayTeamWinCount = awayTeamWinCount
    }
}
