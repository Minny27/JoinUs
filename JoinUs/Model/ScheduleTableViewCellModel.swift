//
//  ScheduleModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

struct ScheduleTableViewCellModel {
    let leagueLogo: String
    let league: String
    let date: String
    let time: String
    let status: String
    let tournamentName: String
    let homeTeam: String
    let homeTeamLogo: String
    let awayTeam: String
    let awayTeamLogo: String
    let homeTeamWinCount: Int
    let awayTeamWinCount: Int
    
    init(leagueLogo: String, league: String, date: String, time: String, status: String, tournamentName: String, homeTeam: String, homeTeamLogo: String, awayTeam: String, awayTeamLogo: String, homeTeamWinCount: Int, awayTeamWinCount: Int) {
        self.leagueLogo = leagueLogo
        self.league = league
        self.date = date
        self.time = time
        self.status = status
        self.tournamentName = tournamentName
        self.homeTeam = homeTeam
        self.homeTeamLogo = homeTeamLogo
        self.awayTeam = awayTeam
        self.awayTeamLogo = awayTeamLogo
        self.homeTeamWinCount = homeTeamWinCount
        self.awayTeamWinCount = awayTeamWinCount
    }
}
