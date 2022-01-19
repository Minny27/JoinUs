//
//  RequestLeagueType.swift
//  JoinUs
//
//  Created by SeungMin on 2022/01/17.
//

import Foundation

enum RequestLeagueType {
    case worlds
    case lck
    
    static let baseUrl: String = "https://api.pandascore.co/lol/matches"
    static let worldsTodayQueryParameter = "/?filter[league_id]=297&filter[begin_at]="
    static let lckTodayQueryParameter = "/?filter[league_id]=293&filter[begin_at]="
    static let lckMonthQueryParameter = "/?filter[league_id]=293"
    static let today = DateFormatter().dateToString(date: Date(), dateFormat: .today)
    static let sortQueryParameter = "&sort=begin_at"
    static let rangeQueryParameter = "&range[begin_at]=2022-01-18"

    // worlds: 297, lck: 293
    private var urlPath: String {
        switch self {
        case .worlds:
//            return RequestLeagueType.worldsTodayQueryParameter + "2021-10-05"
//            + RequestLeagueType.sortQueryParameter
            return RequestLeagueType.worldsTodayQueryParameter + RequestLeagueType.today
            + RequestLeagueType.sortQueryParameter
        case .lck:
//            return RequestLeagueType.lckMonthQueryParameter
//            + RequestLeagueType.sortQueryParameter + RequestLeagueType.rangeQueryParameter
            return RequestLeagueType.lckTodayQueryParameter + RequestLeagueType.today
            + RequestLeagueType.sortQueryParameter
        }
    }
    
    var url: URL? {
        return URL(string: RequestLeagueType.baseUrl + urlPath)
    }
}
