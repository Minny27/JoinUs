//
//  SeasonCollectionViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/30.
//

import Foundation

final class SeasonCollectionViewModel {
    let seasonList: [Season] = [
        Season(year: "2022", seasonName: "Spring"),
        Season(year: "2021", seasonName: "Summer"),
        Season(year: "2021", seasonName: "Spring"),
        Season(year: "2020", seasonName: "Summer"),
        Season(year: "2020", seasonName: "Spring"),
        Season(year: "2019", seasonName: "Summer"),
        Season(year: "2019", seasonName: "Spring"),
        Season(year: "2018", seasonName: "Summer"),
        Season(year: "2018", seasonName: "Spring"),
        Season(year: "2017", seasonName: "Summer"),
        Season(year: "2017", seasonName: "Spring")
    ]
    
    var countSeasonList: Int {
        return seasonList.count
    }
    
    func seasonInfo(at index: Int) -> Season {
        return seasonList[index]
    }
}
