//
//  ScheduleModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

struct LeagueScheduleTableViewCellModel {
    let leagueImage: String?
    let league: String?
    let year: String?
    let month: String?
    let date: String?
    let time: String?
    let status: String?
    let versus: String?
    let homeTeamId: Int?
    let homeTeam: String?
    let homeTeamImageUrl: URL?
    let awayTeamId: Int?
    let awayTeam: String?
    let awayTeamImageUrl: URL?
    let homeTeamWinCount: Int?
    let awayTeamWinCount: Int?
    let winnerId: Int?
}
