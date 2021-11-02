//
//  GetDataType.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/02.
//

import Foundation

enum GetDataType: String {
    case live = "live"
    case completedEvents = "completedEvents"
    
    static let baseUrl: String = "https://esports-api.lolesports.com"
    private var urlPath: String {
        switch self {
        case .live:
            return "/persisted/gw/getLive?hl=ko-KR"
        case .completedEvents:
            return "/persisted/gw/getCompletedEvents?hl=ko-KR"
        }
    }
    
    var url: URL? {
        return URL(string: "\(GetDataType.baseUrl)\(urlPath)")
    }
}
