//
//  DataFotmat.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/05.
//

import Foundation

enum DateFormat {
    case date
    case time
    
    var type: String {
        switch self {
        case .date:
            return "MM-dd"
        case .time:
            return "hh-mm"
        }
    }
}
