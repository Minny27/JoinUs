//
//  StandingsVIewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/25.
//

import Foundation
import SwiftSoup

final class StandingsViewModel {
    var standingsList: Observable<[Standings]> = Observable([])
    
    var countStandingsInfoList: Int {
        return standingsList.value?.count ?? 0
    }
    
    func fetchStandingsData() {
        CrawlManager().crawlLeagueStandings() { standingsList in
            self.standingsList.value = standingsList.compactMap({
                Standings(ranking: $0.ranking,
                          teamImage: $0.teamImage,
                          team: $0.team,
                          wins: $0.wins,
                          loses: $0.loses,
                          winRate: $0.winRate,
                          point: $0.point
                )
            })
        }
    }
    
    func standingsInfo(at index: Int) -> Standings? {
        return standingsList.value?[index]
    }
}
