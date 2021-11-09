//
//  SectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/09.
//

import Foundation
import UIKit

enum SectionHeaderType {
    case schedule
    case player
    case worlds
    case lck
    
    func title() -> String {
        switch self {
        case .schedule:
            return "✪ Match Schedule"
        case .player:
            return "✪ LCK Player"
        case .worlds:
            return "Worlds"
        case .lck:
            return "LCK"
        }
    }
    
    func image() -> Data {
        switch self {
        case .worlds:
            return try! Data(contentsOf: URL(string: "https://cdn.pandascore.co/images/league/image/297/220px-Worlds_2020.png")!)
        case .lck:
            return try! Data(contentsOf: URL(string: "https://cdn.pandascore.co/images/league/image/293/LCK_2021_logo.png")!)
        default:
            return Data()
        }
    }
}
