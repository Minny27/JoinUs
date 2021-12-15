//
//  CrawlManager.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/24.
//

import Foundation
import Alamofire
import SwiftSoup

struct CrawlManager {
    func crawlLeagueStandings(urlString: String, completion: @escaping (([Standings]) -> Void)) {
        var standingsList: [Standings] = []
        
        AF.request(urlString).responseString { response in
            if response.response?.url == nil {
                print(NetworkError.invalidUrl)
                return
            }
            
            if response.error != nil {
                print(NetworkError.invalidResponse)
                return
            }
            
            guard let html = response.value else {
                print(NetworkError.invalidHTML)
                return
            }
            
            do {
                let document: Document = try SwiftSoup.parse(html)
                let elements: Elements = try document.select(Strings.leagueStandingsSelector)

                let standingsDataList = elements.array()
                
                for index in 2..<standingsDataList.count {
                    let standingsTextData = standingsStringDataParsing(try standingsDataList[index].text())

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
    
    func crawlNews(completion: @escaping(([News])-> Void)) {
        var newsList: [News] = []
        let newsPortalBaseUrl = Strings.newsPortalBaseUrl
        let newsPortalLolUrl = Strings.newsPortalLolUrl
        
        AF.request(newsPortalLolUrl).responseString { response in
            if response.response?.url == nil {
                print(NetworkError.invalidUrl)
                return
            }
            
            if response.error != nil {
                print(NetworkError.invalidResponse)
                return
            }
            
            guard let html = response.value else {
                print(NetworkError.invalidHTML)
                return
            }
            
            do {
                let document: Document = try SwiftSoup.parse(html)
                let elements: Elements = try document.select(Strings.newsSelector)
                                
                for element in elements {
                    let imageRelativePath = try element.select("img").attr("src")
                    let imageUrl = newsPortalBaseUrl + imageRelativePath
                    let photo = try Data(contentsOf: URL(string: imageUrl)!)
                    let title = try element.select("p.tit").text()
                    let etc = try element.select("p.etc").text()
                    let detailRelativePath = try element.select("p.tit").select("a").attr("href")
                    let detailUrlString = newsPortalBaseUrl + detailRelativePath
                                        
                    newsList.append(
                        News(
                            photo: photo,
                            title: title,
                            etc: etc,
                            detailUrlString: detailUrlString
                        )
                    )
                }
                
                completion(newsList)
                
            } catch {
                print(NetworkError.parsingError)
            }
        }
    }
    
    func crawlPlayerDetail(urlString: String, completion: @escaping((PlayerDetail) -> Void)) {
        AF.request(urlString).responseString { response in
            if response.response?.url == nil {
                print(NetworkError.invalidUrl)
                return
            }
            
            if response.error != nil {
                print(NetworkError.invalidResponse)
                return
            }
            
            guard let html = response.value else {
                print(NetworkError.invalidHTML)
                return
            }
            
            do {
                let document: Document = try SwiftSoup.parse(html)
                let elements: Elements = try document.select(Strings.playerDetailSelector)
                
                // 1: 팀, 이이디, 2: 이름, 3: 출생, 4: 국적, 8: 라인
                var teamData = try elements[1].select("td > div > strong").text().components(separatedBy: " ")
                let gameId = teamData.removeLast()
                let team = Array(teamData).joined(separator: " ")
                let name = try elements[2].select("td > div > strong").text().components(separatedBy: " ")[0]
                let birthData = try elements[3].select("td:nth-child(2) > div").text().components(separatedBy: " ")
                let birth = birthData[0] + " " + birthData[1] + " " + birthData[2] + " " + birthData[3]
                let nationality = try elements[4].select("td:nth-child(2) > div > a").text()
                let roleImageRelativePath = try elements[8].select("td:nth-child(2) > div > a.wiki-link-internal > span > span > img").attr("src")
                let roleImageUrl = Strings.roleImageHttps + roleImageRelativePath
                let roleImageData = try Data(contentsOf: URL(string: roleImageUrl)!)
                let role = try elements[8].select("td:nth-child(2) > div > a.wiki-link-internal").text()
                
                let playerDetail = PlayerDetail(
                    imageString: "\(gameId).jpg",
                    team: team,
                    roleImageData: roleImageData,
                    role: role,
                    gameId: gameId,
                    name: name,
                    birth: birth,
                    nationality: nationality
                )
                
                completion(playerDetail)
                
            } catch {
                print(NetworkError.parsingError)
            }
        }
    }
    
    func standingsStringDataParsing(_ standingsData: String) -> [String] {
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

