//
//  SectionHeader.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/09.
//

import Foundation
import UIKit

enum HomeTableViewSectionType: Int {
    case schedule
    case player
    
    enum cellType: Int {
        case team
        case players
    }
    
    func title() -> String {
        switch self { 
        case .schedule:
            return "✪ Today's Match"
        case .player:
            return "✪ LCK Player"
        }
    }
}
