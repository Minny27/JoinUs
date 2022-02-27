//
//  TeamModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/06.
//

import UIKit

struct Team {
    let team: String
    let imageString: String
    let teamColor: UIColor
    
    init(
        _ team: String,
        _ imageString: String,
        _ teamColor: UIColor
    ) {
        self.team = team
        self.imageString = imageString
        self.teamColor = teamColor
    }
}
