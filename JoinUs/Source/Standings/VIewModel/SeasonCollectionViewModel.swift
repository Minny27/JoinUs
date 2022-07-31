//
//  SeasonCollectionViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/30.
//

import Foundation

final class SeasonCollectionViewModel {
    let seasonList: [Season] = [
        Season(year: "2022", season: "Summer"),
        Season(year: "2022", season: "Spring"),
        Season(year: "2021", season: "Summer"),
        Season(year: "2021", season: "Spring"),
        Season(year: "2020", season: "Summer"),
        Season(year: "2020", season: "Spring"),
        Season(year: "2019", season: "Summer"),
        Season(year: "2019", season: "Spring"),
        Season(year: "2018", season: "Summer"),
        Season(year: "2018", season: "Spring"),
        Season(year: "2017", season: "Summer"),
        Season(year: "2017", season: "Spring")
    ]
    
    var countSeasonList: Int {
        return seasonList.count
    }
    
    func seasonInfo(at index: Int) -> Season {
        return seasonList[index]
    }
}
