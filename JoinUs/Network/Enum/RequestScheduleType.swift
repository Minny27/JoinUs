//
//  GetDataType.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

enum RequestScheduleType {
    case past(league: String)
    case running(league: String)
    case upcoming(league: String)
    
    static let baseUrl: String = "https://api.pandascore.co/lol/matches"
    
    // worlds: 297, lck: 293
    private var urlPath: String {
        switch self {
        case .past(let league):
            switch league {
            case "worlds":
                return "/past?filter[league_id]=297&filter[begin_at]=2021-10-31"
            case "lck":
                return "/past?filter[league_id]=293&filter[begin_at]=2021-09-02"
            default:
                return ""
            }
        case .running(let league):
            switch league {
            case "worlds":
                return "/running?filter%5Bleague_id%5D=297&%5Bbegin_at%5D=2021-01-01T00:00:00Z"
            case "lck":
                return "/running?filter%5Bleague_id%5D=293&%5Bbegin_at%5D=2021-01-01T00:00:00Z"
            default:
                return ""
            }
        case .upcoming(let league):
            switch league {
            case "worlds":
                return "/upcoming?filter[league_id]=297&filter[begin_at]=2021-11-06"
            case "lck":
                return "/upcoming?filter%5Bleague_id%5D=293&%5Bbegin_at%5D=2021-01-01T00:00:00Z"
            default:
                return ""
            }
        }
    }
    
    var url: URL? {
        return URL(string: "\(RequestScheduleType.baseUrl)\(urlPath)")
    }
}
