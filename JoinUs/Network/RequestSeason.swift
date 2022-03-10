//
//  RequestSeasonType.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/01.
//

import Foundation

struct RequestSeason {
    static var year = "2022"
    static var season = "Spring"
    static var seasonString = "_Season"
    static var baseUrl = "https://lol.fandom.com/wiki/LCK"
    static var urlPath: String {
            return "\(RequestSeason.baseUrl)/\(RequestSeason.year)\(RequestSeason.seasonString)/\(RequestSeason.season)\(RequestSeason.seasonString)"
    }
}
