//
//  RequestSeasonType.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/01.
//

import Foundation

struct RequestSeason {
    static var year = "2021"
    static var seasonName = "Summer"
    static var seasonString = "_Season"
    static var baseUrl = "https://lol.fandom.com/wiki/LCK"
    static var urlPath: String {
            return "\(RequestSeason.baseUrl)/\(RequestSeason.year)\(RequestSeason.seasonString)/\(RequestSeason.seasonName)\(RequestSeason.seasonString)"
    }
}
