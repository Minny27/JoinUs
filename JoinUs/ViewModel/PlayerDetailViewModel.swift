//
//  PlayerDetailViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/14.
//

import Foundation

final class PlayerDetailViewModel {
    let playerDetail: Observable<PlayerDetail> = Observable(nil)
    
    func fetchData(urlString: String) {
        CrawlManager().crawlPlayerDetail(urlString: urlString) { playerDetail in
            self.playerDetail.value = PlayerDetail(
                imageString: playerDetail.imageString,
                team: playerDetail.team,
                roleImageData: playerDetail.roleImageData,
                role: playerDetail.role,
                gameId: playerDetail.gameId,
                name: playerDetail.name,
                birth: playerDetail.birth,
                nationality: playerDetail.nationality
            )
        }
    }
}
