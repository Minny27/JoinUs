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
    static let worldsLeagueQueryParameter = "/?filter[league_id]=297"
    static let lckLeagueQueryParameter = "/?filter[league_id]=293"
    static let today = DateFormatter().dateToString(date: Date(), dateFormat: .today)
    static let DayQueryParameter = "&filter[begin_at]=\(RequestLeagueType.today)"
    static let todaySortQueryParameter = "&sort=begin_at"
    static let totalSortQueryParameter = "&sort=-begin_at"
//    static let pageQueryParameter = "&page[number]=1&page[size]=50"
    static let rangeQueryParameter = "&page=2&per_page=500"

    // worlds: 297, lck: 293
    private var todayScheduleUrlQuery: String {
        switch self {
        case .worlds:
            return RequestLeagueType.worldsLeagueQueryParameter + "&filter[begin_at]=2021-10-05"
            + RequestLeagueType.todaySortQueryParameter
//            return RequestLeagueType.worldsLeagueQueryParameter + RequestLeagueType.DayQueryParameter
//            + RequestLeagueType.todaySortQueryParameter
        case .lck:
            return RequestLeagueType.lckLeagueQueryParameter + "&filter[begin_at]=2022-01-01"
            + RequestLeagueType.todaySortQueryParameter
//            return RequestLeagueType.lckLeagueQueryParameter + RequestLeagueType.DayQueryParameter
//            + RequestLeagueType.todaySortQueryParameter
        }
    }
    
    private var totalScheduleUrlQuery: String {
        switch self {
        case .worlds:
            return RequestLeagueType.worldsLeagueQueryParameter + RequestLeagueType.totalSortQueryParameter
//            + RequestLeagueType.pageQueryParameter
            + RequestLeagueType.rangeQueryParameter
        case .lck:
            return RequestLeagueType.lckLeagueQueryParameter + RequestLeagueType.totalSortQueryParameter
//            + RequestLeagueType.pageQueryParameter
            + RequestLeagueType.rangeQueryParameter
        }
    }
    
    var todayScheduleUrl: URL? {
        return URL(string: RequestLeagueType.baseUrl + todayScheduleUrlQuery)
    }
    
    var totalScheduleUrl: URL? {
        return URL(string: RequestLeagueType.baseUrl + totalScheduleUrlQuery)
    }
    
}
