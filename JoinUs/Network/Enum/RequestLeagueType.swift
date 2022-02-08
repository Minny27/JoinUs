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
    static let worldsLeagueQuery = "/?filter[league_id]=297"
    static let lckLeagueQuery = "/?filter[league_id]=293"
    static let today = DateFormatter().dateToString(date: Date(), dateFormat: .today)
    static let DayQuery = "&filter[begin_at]=\(RequestLeagueType.today)"
    static let todaySortQuery = "&sort=begin_at"
    static let totalSortQuery = "&sort=-begin_at"
    static let pageSizeQuery = "&page[size]=100"
    static let pageNumberQuery = "&page[number]="
    static var pageNumber = "1"

    // worlds: 297, lck: 293
    private var todayScheduleUrlQuery: String {
        switch self {
        case .worlds:
            return RequestLeagueType.worldsLeagueQuery + "&filter[begin_at]=2021-10-05"
            + RequestLeagueType.todaySortQuery
//            return RequestLeagueType.worldsLeagueQuery + RequestLeagueType.DayQuery
//            + RequestLeagueType.todaySortQuery
        case .lck:
            return RequestLeagueType.lckLeagueQuery + "&filter[begin_at]=2022-01-01"
            + RequestLeagueType.todaySortQuery
//            return RequestLeagueType.lckLeagueQuery + RequestLeagueType.DayQuery
//            + RequestLeagueType.todaySortQuery
        }
    }
    
    private var totalScheduleUrlQuery: String {
        switch self {
        case .worlds:
            return RequestLeagueType.worldsLeagueQuery + RequestLeagueType.totalSortQuery
            + RequestLeagueType.pageSizeQuery + RequestLeagueType.pageNumberQuery
            + RequestLeagueType.pageNumber
        case .lck:
            return RequestLeagueType.lckLeagueQuery + RequestLeagueType.totalSortQuery
            + RequestLeagueType.pageSizeQuery + RequestLeagueType.pageNumberQuery
            + RequestLeagueType.pageNumber
        }
    }
    
    var todayScheduleUrl: URL? {
        return URL(string: RequestLeagueType.baseUrl + todayScheduleUrlQuery)
    }
    
    var totalScheduleUrl: URL? {
        return URL(string: RequestLeagueType.baseUrl + totalScheduleUrlQuery)
    }
    
}
