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
    
    init(
        _ team: String,
        _ imageString: String
    ) {
        self.team = team
        self.imageString = imageString
    }
}
