//
//  CrawlManager.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/24.
//

import Alamofire
import SwiftSoup

struct CrawlManager {
    func crawlLeagueStandings(completion: @escaping (([Standings]) -> Void)) {
        var standingsList: [Standings] = []
        let urlString = "https://lol.fandom.com/wiki/LCK/2021_Season/Summer_Season"
        
        AF.request(urlString).responseString { response in
            guard let html = response.value else {
                print(NetworkError.invalidHTML)
                return
            }
            
            do {
                let document: Document = try SwiftSoup.parse(html)
                let elements: Elements = try document.select("#mw-content-text > div.mw-parser-output > div.mw-parser-output > div.inline-content > div.standings-outer-div > div > table.wikitable2.standings > tbody > tr")

                let standingsDataList = elements.array()
                
                for index in 2..<standingsDataList.count {
                    let standingsTextData = standingsStringDataSplit(try standingsDataList[index].text())

                    let standingsTeamImageString = try standingsDataList[index].select("img").attr("data-src")

                    standingsList.append(
                        Standings(ranking: standingsTextData[0],
                                  teamImage: try Data(contentsOf: URL(string: standingsTeamImageString)!),
                                  team: standingsTextData[1],
                                  wins: standingsTextData[2],
                                  loses: standingsTextData[3],
                                  winRate: standingsTextData[4],
                                  point: standingsTextData[5]
                        )
                    )
                }
                
                completion(standingsList)
                
            } catch {
                print(NetworkError.parsingError)
            }
        }
    }
    
    func standingsStringDataSplit(_ standingsData: String) -> [String] {
        var standingsTextData: [String] = []
        let blankComponentsData = standingsData.components(separatedBy: " ")
        let intDataList = blankComponentsData.compactMap{ Int($0) }
        let stringDataList = blankComponentsData.filter{ !intDataList.map { String($0) }.contains($0) }
        var hipenIndex = 0
        
        for index in 0..<stringDataList.count {
            if stringDataList[index] == "-" {
                hipenIndex = index
                break
            }
        }
        
        standingsTextData.append(String(intDataList[0]))
        standingsTextData.append(stringDataList[0])
        standingsTextData.append(String(intDataList[1]))
        standingsTextData.append(String(intDataList[2]))
        standingsTextData.append(stringDataList[hipenIndex + 1])
        standingsTextData.append(String(intDataList[intDataList.count - 1]))
                
        return standingsTextData
    }
}

