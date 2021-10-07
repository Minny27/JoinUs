//
//  TeamModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/06.
//

import Foundation
import UIKit

struct TeamModel {
    let teamName: String
    let teamImageName: String
    
    init(teamName: String, teamImageName: String) {
        self.teamName = teamName
        self.teamImageName = teamImageName
    }
}
