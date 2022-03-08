//
//  PlayerDetailDataType.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/14.
//

import Foundation

enum PlayerDetailCategoryType: Int {
    case image, team, role, nickName, name, birth, nationality
    
    var category: String {
        switch self {
        case .image:
            return "이미지"
        case .team:
            return "팀"
        case .role:
            return "라인"
        case .nickName:
            return "닉네임"
        case .name:
            return "이름"
        case .birth:
            return "출생"
        case .nationality:
            return "국적"
        }
    }
}
