//
//  DataFotmat.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/05.
//

import Foundation

enum DateFormat {
    case today
    case year
    case month
    case date
    case time
    
    var type: String {
        switch self {
        case .today:
            return "YYYY-MM-dd"
        case .year:
            return "YYYY"
        case .month:
            return "MM"
        case .date:
            return "MM-dd"
        case .time:
            return "HH-mm"
        }
    }
}
