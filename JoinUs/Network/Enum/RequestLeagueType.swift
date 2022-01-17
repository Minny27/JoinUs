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
    static let worldsQueryParameter = "/?filter[league_id]=297&filter[begin_at]="
    static let lckQueryParameter = "/?filter[league_id]=293&filter[begin_at]="
    static let today = DateFormatter().dateToString(date: Date(), dateFormat: .today)

    // worlds: 297, lck: 293
    private var urlPath: String {
        switch self {
        case .worlds:
            return RequestLeagueType.worldsQueryParameter + RequestLeagueType.today
        case .lck:
            return RequestLeagueType.lckQueryParameter + RequestLeagueType.today
        }
    }
    
    var url: URL? {
        return URL(string: RequestLeagueType.baseUrl + urlPath)
    }
}
