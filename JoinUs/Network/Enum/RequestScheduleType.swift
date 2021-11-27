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
                return "/past?filter[league_id]=297"
            case "lck":
                return "/past?filter[league_id]=293"
            default:
                return ""
            }
            
        case .running(let league):
            switch league {
            case "worlds":
                return "/past?filter[league_id]=297&filter[begin_at]=2021-08-01&sort=begin_at"
            case "lck":
//                return "/past?filter[league_id]=293"
                return "/past?filter[league_id]=293&filter[begin_at]=2021-11-06"
            default:
                return ""
            }
            
        case .upcoming(let league):
            switch league {
            case "worlds":
                return "/upcoming?filter[league_id]=297"
            case "lck":
                return "/upcoming?filter[league_id]=293"
            default:
                return ""
            }
        }
    }
    
    var url: URL? {
        return URL(string: "\(RequestScheduleType.baseUrl)\(urlPath)")
    }
}
