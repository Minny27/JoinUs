//
//  PlayerDetail.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/13.
//

import Foundation
import UIKit

struct PlayerDetail {
    let imageString: String
    let team: String
    let roleImageData: Data
    let role: String
    let gameId: String
    let name: String
    let birth: String
    let nationality: String
    
    init(
        imageString: String,
        team: String,
        roleImageData: Data,
        role: String,
        gameId: String,
        name: String,
        birth: String,
        nationality: String
    ) {
        self.imageString = imageString
        self.team = team
        self.roleImageData = roleImageData
        self.role = role
        self.gameId = gameId
        self.name = name
        self.birth = birth
        self.nationality = nationality
    }
}
