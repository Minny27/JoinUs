//
//  PlayerModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import Foundation

struct PlayerModel {
    let teamName: String
    let playerName: String
    let playerImageName: String
    let playerLine: String
    
    init(teamName: String, playerName: String, playerImageName: String, playerLine: String) {
        self.teamName = teamName
        self.playerName = playerName
        self.playerImageName = playerImageName
        self.playerLine = playerLine
    }
}
