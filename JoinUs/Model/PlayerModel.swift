//
//  PlayerModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import Foundation
import UIKit

struct PlayerModel {
    let teamName: String
    let playerName: String
    let playerImageName: String
    let playerLine: String
    let teamColor: UIColor
    
    init(teamName: String, playerName: String, playerImageName: String, playerLine: String, teamColor: UIColor) {
        self.teamName = teamName
        self.playerName = playerName
        self.playerImageName = playerImageName
        self.playerLine = playerLine
        self.teamColor = teamColor
    }
}
