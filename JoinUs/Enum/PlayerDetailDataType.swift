//
//  PlayerDetailDataType.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/14.
//

import Foundation

enum PlayerDetailDataType: Int {
    case name
    case birth
    case nationality
    
    func category() -> String {
        switch self {
        case .name:
            return "이름"
        case .birth:
            return "출생"
        case .nationality:
            return "국적"
        }
    }
}
