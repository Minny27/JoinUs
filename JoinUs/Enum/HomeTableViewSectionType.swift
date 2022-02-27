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
    case teamPlayer
    
    func title() -> String {
        switch self { 
        case .schedule:
            return "✪ Today's Match"
        case .teamPlayer:
            return "✪ LCK Player"
        }
    }
}
