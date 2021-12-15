//
//  PlayerModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import Foundation
import UIKit

struct Player {
    let team: String
    let gameId: String
    let imageString: String
    let role: String
    let teamColor: UIColor
    let namePathVariable: String
    
    init(
        _ team: String,
        _ gameId: String,
        _ imageString: String,
        _ role: String,
        _ teamColor: UIColor,
        _ namePathVariable: String
    ) {
        self.team = team
        self.gameId = gameId
        self.imageString = imageString
        self.role = role
        self.teamColor = teamColor
        self.namePathVariable = namePathVariable
    }
}
