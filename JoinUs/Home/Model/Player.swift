//
//  PlayerModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import UIKit

struct Player {
    let team: String
    let gameId: String
    let imageString: String
    let role: String
    let teamColor: UIColor
    let name: String
    let birth: String
    let nationality: String
    
    init(
        _ team: String,
        _ gameId: String,
        _ imageString: String,
        _ role: String,
        _ teamColor: UIColor,
        _ name: String,
        _ birth: String,
        _ nationality: String
    ) {
        self.team = team
        self.gameId = gameId
        self.imageString = imageString
        self.role = role
        self.teamColor = teamColor
        self.name = name
        self.birth = birth
        self.nationality = nationality
    }
}
