//
//  TableViewSectionType.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/11.
//

import Foundation

enum LeagueScheduleTableViewSectionType: String {
    case worlds = "worlds"
    case lck = "lck"
    
    func title() -> String {
        switch self {
        case .worlds:
            return "Worlds"
        case .lck:
            return "LCK"
        }
    }
    
    func imageUrl() -> URL {
        switch self {
        case .worlds:
            return URL(string: "https://cdn.pandascore.co/images/league/image/297/220px-Worlds_2020.png")!
        case .lck:
            return URL(string: "https://cdn.pandascore.co/images/league/image/293/LCK_2021_logo.png")!
        }
    }
}
